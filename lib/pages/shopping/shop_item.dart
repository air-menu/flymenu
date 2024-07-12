import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flymenu/ViewModel/shop_view_model.dart';
import 'package:provider/provider.dart';

import '../../Model/product.dart';

class ShopItem extends StatefulWidget {

  ShopItem({super.key, required this.productQuantity});

  @override
  State<ShopItem> createState() => ShopItemState();

  late MapEntry<Product, int> productQuantity;
}

class ShopItemState extends State<ShopItem> {
  @override
  Widget build(BuildContext context) {
    var product = widget.productQuantity.key;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          flex: 2,
          child: Column(
            children: [
              Text(product.title, style: Theme.of(context).primaryTextTheme.labelLarge),
              Text("${product.getPriceReduce()} €", style: Theme.of(context).primaryTextTheme.labelMedium),
            ],
          ),
        ),
        Flexible(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                flex: 1,
                child: Text("x${widget.productQuantity.value}", style: Theme.of(context).primaryTextTheme.labelMedium)
              ),
              Flexible(
                flex: 2,
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.keyboard_arrow_up),
                      onPressed: () => context.read<ShopViewModel>().upQuantity(product),
                      padding: const EdgeInsets.only(top: 20),
                    ),
                    IconButton(
                      icon: const Icon(Icons.keyboard_arrow_down),
                      onPressed: () => context.read<ShopViewModel>().downQuantity(product),
                      padding: const EdgeInsets.only(bottom: 20),
                    ),
                  ],
                ),
              ),
              IconButton(icon: const Icon(Icons.remove), onPressed: () => context.read<ShopViewModel>().removeProduct(product)),
            ],
          ),
        ),
      ],
    );
  }
}