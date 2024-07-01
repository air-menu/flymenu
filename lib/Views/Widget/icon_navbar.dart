import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconNavbar extends StatelessWidget {

  final String iconName;
  final Icon picture;

  const IconNavbar({super.key, required this.iconName, required this.picture});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 103,
      height: 75,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: picture,
              ),
              const SizedBox(height: 6),
              const Text(
                'Menu',
                style: TextStyle(
                  color: Color(0x3F30363D),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}