import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuWidget extends StatelessWidget {

  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox.expand(
          child: FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 0.3,
            child: DecoratedBox(decoration: BoxDecoration(color: Color(0x7F30363D))),
          ),
        ),
        Column(
          children: [
            Text(
              'Menu',
              style: TextStyle(
                color: Color(0xFF30363D),
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
                letterSpacing: -0.48,
              ),
            ),
            SizedBox(
              width: 311,
              child: Text(
                'Lorem ipsum sit dolore amet et saepe adrium venit. Lorem ipsum sit dolore amet et saepe adrium venit.',
                style: TextStyle(
                  color: Color(0x7F30363D),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: -0.28,
                ),
              ),
            ),
            IntrinsicHeight(), //TODO: Rajouter la liste view et les items
          ],
        ),
      ]
    );
  }

}