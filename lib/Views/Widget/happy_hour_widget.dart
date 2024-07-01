import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HappyHourWidget extends StatelessWidget {

  final bool isVisible;

  const HappyHourWidget({super.key, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: ShapeDecoration(
          color: const Color(0x198876FE),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Happy hour',
              style: Theme.of(context).primaryTextTheme.labelSmall
            ),
          ],
        ),
      ),
    );
  }

}