import 'package:flutter/cupertino.dart';
import 'package:flymenu/Helper/colors_constante.dart';

class ElementListWidget extends StatefulWidget {
  const ElementListWidget({super.key});

  @override
  ElementListState createState() => ElementListState();
}

class ElementListState extends State<ElementListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 137,
      decoration: const BoxDecoration(color: ColorConstant.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 311,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 215,
                          child: Text(
                            'Grim Blonde',
                            style: TextStyle(
                              color: Color(0xFF30363D),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                              letterSpacing: -0.32,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          width: 215,
                          child: Text(
                            'Lorem ipsum sit dolore amet et saepe adrium venit.',
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
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          '4,50 € - 12,00 €',
                          style: TextStyle(
                            color: Color(0xFF027FFF),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                            letterSpacing: -0.28,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: ShapeDecoration(
                            color: const Color(0x198876FE),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Happy hour',
                                style: TextStyle(
                                  color: Color(0xFF8876FE),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                  letterSpacing: -0.24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 32),
                Container(
                  width: 64,
                  height: 64,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: NetworkImage("https://simon-simone.fr/5413-large_default/lot-de-6-verres-a-biere-cabernet-chef-sommelier.jpg"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}