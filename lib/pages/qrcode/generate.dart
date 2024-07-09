import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_image_generator/qr_image_generator.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class GenerateQRCodePage extends StatefulWidget {
  @override
  _GenerateQRCodePageState createState() => _GenerateQRCodePageState();
}

class _GenerateQRCodePageState extends State<GenerateQRCodePage> {
  final restaurantIdController = TextEditingController();
  final tableNumberController = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Generate QR Code')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: restaurantIdController,
              decoration: InputDecoration(labelText: 'Restaurant ID'),
              onChanged: (value) => setState(() {}),
            ),
            TextField(
              controller: tableNumberController,
              decoration: InputDecoration(labelText: 'Table Number'),
              onChanged: (value) => setState(() {}),
            ),
            ElevatedButton(
              onPressed: saveQRImage,
              child: Text('Generate QR Code'),
            ),
            Screenshot(
              controller: screenshotController,
              child: QrImageView(
                data: '${restaurantIdController.text}-${tableNumberController.text}',
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _captureAndSaveQRCode() async {
    setState(() {});
    if (restaurantIdController.text.isEmpty || tableNumberController.text.isEmpty) {
      // Show an error message if the fields are empty
      return;
    }

    // Capture the QR code as an image
    Uint8List? image = await screenshotController.capture();
    if (image == null) {
      // Handle the case where the capture failed
      return;
    }
    print(image);

    // Save the image to the device's storage
    final result = await _saveImage(image);

    // Show a message indicating where the image was saved
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('QR code saved to ${result['filePath']}')),
    );
  }

  Future<Map<String, dynamic>> _saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'screenshot_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    return result;
  }

Future saveQRImage() async {

    final generator = QRGenerator();
    final outputDir = await getTemporaryDirectory();
    final output = await getDownloadsDirectory();

    await generator.generate(
      data: 'bonjour',
      filePath: '$output/qrcode.png',
      scale: 10,
      foregroundColor: Colors.yellow,
      backgroundColor: Colors.blue,
      errorCorrectionLevel: ErrorCorrectionLevel.medium,
      qrVersion: 4,
    );
  }
}


