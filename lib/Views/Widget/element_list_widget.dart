import 'package:flutter/cupertino.dart';
import 'package:flymenu/Helper/colors_constante.dart';
import 'package:flymenu/Model/product.dart';

class ElementListWidget extends StatefulWidget {
  const ElementListWidget({super.key, required this.product});

  final Product product;

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
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 215,
                          child: Text(
                            widget.product.title,
                            style: const TextStyle(
                              color: Color(0xFF30363D),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                              letterSpacing: -0.32,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 215,
                          child: Text(
                            widget.product.description,
                            style: const TextStyle(
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
                        Text(
                          "${widget.product.price.toString()} €",
                          style: const TextStyle(
                            color: Color(0xFF027FFF),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                            letterSpacing: -0.28,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Visibility(
                          visible: widget.product.isHappyHour,
                          child: Container(
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
                    image: DecorationImage(
                      image: NetworkImage(widget.product.imagePath),
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