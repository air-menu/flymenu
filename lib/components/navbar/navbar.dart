import 'package:flutter/material.dart';
import 'package:flymenu/components/navbar/navbar-item.dart';
import 'package:flymenu/pages/profile/profileview.dart';
import 'package:flymenu/pages/qrcode/scan.dart';
import 'package:flymenu/pages/menu/menu_widget.dart';
import 'package:flymenu/pages/shopping/shopping_basket.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _Navbar();
}

class _Navbar extends State<Navbar> {
  int pageIndex = 0;

  final List<Map<String, dynamic>> navItemsMobile = [
    // TODO Ajouter les pages de l'application
    {'icon': Icons.qr_code, 'title': 'ScanCode', 'page': ScanQRCodePage()}, // Pour le client
    //{'icon': Icons.qr_code, 'title': 'GenerateQRCode', 'page': GenerateQRCodePage()}, // Pour le restaurateur
    // {'icon': Icons.menu_book_rounded, 'title': 'Menu', 'page': const MenuWidget()},
    // {'icon': Icons.shopping_cart, 'title': 'panier', 'page': const ShoppingBasket()},
    {'icon': Icons.person, 'title': 'Profile', 'page': const ProfileView()},
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
        decoration: ShapeDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              width: 2,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0x0C30363D),
            ),
          ),
        ),
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
