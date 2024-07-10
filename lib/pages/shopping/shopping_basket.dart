import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flymenu/ViewModel/shop_view_model.dart';
import 'package:flymenu/pages/shopping/shop_item.dart';
import 'package:provider/provider.dart';

class ShoppingBasket extends StatefulWidget {
  const ShoppingBasket({super.key});

  @override
  ShoppingBasketState createState() => ShoppingBasketState();
}

class ShoppingBasketState extends State<ShoppingBasket> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShopViewModel>(
        builder: (context, shopViewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Mon panier", style: Theme.of(context).primaryTextTheme.titleLarge),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 400, minHeight: 0),
                  child: Container(
                    decoration: ShapeDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                        itemCount: shopViewModel.productsQuantity.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: ShopItem(productQuantity: shopViewModel.productsQuantity.entries.elementAt(index)),
                          );
                        }
                    ),
                  ),
                ),
                //Container(),
              ],
            ),
          );
        }
    );
  }

}