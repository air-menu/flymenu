import 'package:flutter/material.dart';

class NavBarItemMobile extends StatefulWidget {
  final int pageIndex;
  final int index;
  final List<Map<String, dynamic>> navItems;
  final Function(int) onItemClicked;

  const NavBarItemMobile(
      {Key? key,
      required this.pageIndex,
      required this.navItems,
      required this.onItemClicked,
      required this.index})
      : super(key: key);

  @override
  State<NavBarItemMobile> createState() => _NavBarItemMobileState();
}

class _NavBarItemMobileState extends State<NavBarItemMobile> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarTheme = theme.appBarTheme;
    final iconColor = widget.pageIndex == widget.index ? appBarTheme.foregroundColor : appBarTheme.iconTheme?.color;
    return IconButton(
      enableFeedback: false,
      onPressed: () {
        widget.onItemClicked(widget.index);
      },
      icon: Icon(
        widget.navItems[widget.index]['icon'],
        color: iconColor,
        size: 35,
      ),
    );
  }
}