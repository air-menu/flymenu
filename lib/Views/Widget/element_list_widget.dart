import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flymenu/Helper/colors_constante.dart';
import 'package:flymenu/Model/product.dart';
import 'package:flymenu/Views/Widget/happy_hour_widget.dart';

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
                            style: Theme.of(context).primaryTextTheme.labelMedium
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 215,
                          child: Text(
                            widget.product.description,
                            style: Theme.of(context).primaryTextTheme.bodySmall,
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
                          style: Theme.of(context).primaryTextTheme.labelMedium,
                        ),
                        const SizedBox(width: 8),
                        HappyHourWidget(isVisible: widget.product.isHappyHour),
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