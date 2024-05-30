import 'package:flutter/material.dart';
import 'package:flymenu/components/navbar/navbar-item.dart';
import 'package:flymenu/pages/parameters/language_selection_page.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _Navbar();
}

class _Navbar extends State<Navbar> {
  int pageIndex = 0;

  final List<Map<String, dynamic>> navItemsMobile = [
    // TODO Ajouter les pages de l'application
    {'icon': Icons.home, 'title': 'Home', 'page': const LanguageSelectionPage()},
    // {'icon': Icons.person, 'title': 'Profile', 'page': ProfileView()},
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
