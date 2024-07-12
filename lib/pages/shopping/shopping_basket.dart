import 'package:dotted_border/dotted_border.dart';
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
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Mon panier", style: Theme.of(context).primaryTextTheme.titleLarge),
                      const Icon(Icons.shopping_cart),
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
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
                                return ShopItem(productQuantity: shopViewModel.productsQuantity.entries.elementAt(index));
                              }
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      DottedBorder(
                        borderType: BorderType.RRect,
                        color: Theme.of(context).colorScheme.onSurface,
                        strokeWidth: 2,
                        dashPattern: const [6,4],
                        radius: const Radius.circular(16),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(16)),
                            child: Container(
                              padding: const EdgeInsets.all(22),
                              width: double.infinity,
                              child: Text("Ajouter un pourboire", style: Theme.of(context).primaryTextTheme.bodyMedium, textAlign: TextAlign.center),
                            ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text("Total ${shopViewModel.totalPrice} € TTC",
                        style: Theme.of(context).primaryTextTheme.bodyLarge,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: ShapeDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                          child: Text("Table 102",
                              style: Theme.of(context).primaryTextTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () { /*TODO : Go to paiment page */},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Theme.of(context).colorScheme.onPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // Reduced border radius
                          ),
                        ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Valider et payer ${shopViewModel.totalPrice} € TTC",
                                    style: Theme.of(context).primaryTextTheme.titleMedium
                                ),
                                const Icon(Icons.arrow_forward_sharp),
                              ],
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

}