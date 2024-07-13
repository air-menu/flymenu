import 'package:flutter/material.dart';
import 'package:flymenu/Model/restaurant.dart';
import 'package:flymenu/pages/menu/menu_widget.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:convert';

class ScanQRCodePage extends StatefulWidget {
  @override
  _ScanQRCodePageState createState() => _ScanQRCodePageState();
}

class _ScanQRCodePageState extends State<ScanQRCodePage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scan QR Code')),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // Afficher les données du QR code dans la console
      print('Scanned QR Code: ${scanData.code}');

      // Parse JSON data
      try {
        final data = jsonDecode(scanData.code!);
        final restaurant = Restaurant(
          id: data['restaurantID'],
          name: '',  // Assurez-vous d'ajouter les informations nécessaires ici
          address: '',  // Assurez-vous d'ajouter les informations nécessaires ici
          isOpen: true,  // Assurez-vous d'ajouter les informations nécessaires ici
          menus: [],  // Assurez-vous d'ajouter les informations nécessaires ici ou dans MenuWidget
        );

        // Afficher les informations extraites
        print('Restaurant ID: ${restaurant.id}');

        // Naviguer vers le MenuWidget avec les données du restaurant
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MenuWidget(restaurant: restaurant),
          ),
        );

      } catch (e) {
        print('Failed to decode QR code: $e');
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
