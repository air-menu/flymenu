import 'package:flutter/material.dart';
import 'package:flymenu/components/navbar/navbar-item.dart';
import 'package:flymenu/pages/parameters/language_selection_page.dart';
import 'package:flymenu/pages/profile/profileview.dart';
import 'package:flymenu/pages/qrcode/scan.dart';
import 'package:flymenu/pages/qrcode/generate.dart';
import 'package:flymenu/Views/menu_widget.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _Navbar();
}

class _Navbar extends State<Navbar> {
  int pageIndex = 0;

  final List<Map<String, dynamic>> navItemsMobile = [
    // TODO Ajouter les pages de l'application
    {'icon': Icons.qr_code, 'title': 'ScanCode', 'page': ScanQRCodePage()},
    {'icon': Icons.qr_code_2_sharp, 'generateQRCode': 'Home', 'page': GenerateQRCodePage()},
    {'icon': Icons.home, 'title': 'Home', 'page': const MenuWidget()},
    {'icon': Icons.language, 'title': 'Langue', 'page': const LanguageSelectionPage()},
    {'icon': Icons.person, 'title': 'Profile', 'page': const ProfileView()},
    
    // {'icon': Icons.person, 'title': 'Profile', 'page': const MenuWidget()},
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return NavbarMobile(navItems: navItemsMobile, pageIndex: pageIndex);
      },
    );
  }
}


class NavbarMobile extends StatefulWidget {
  final List<Map<String, dynamic>> navItems;
  final int pageIndex;

  NavbarMobile({Key? key, required this.navItems, required this.pageIndex})
      : super(key: key);

  @override
  State<NavbarMobile> createState() => _NavbarMobileState();
}

class _NavbarMobileState extends State<NavbarMobile> {
  late int pageIndex;

  @override
  void initState() {
    super.initState();

    pageIndex = widget.pageIndex;
  }

  void onItemClicked(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navItems[pageIndex]['page'],
      bottomNavigationBar: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(widget.navItems.length, (index) {
            return NavBarItemMobile(
                onItemClicked: onItemClicked,
                pageIndex: pageIndex,
                navItems: widget.navItems,
                index: index);
          }),
        ),
      ),
    );
  }
}
