import 'package:flutter/cupertino.dart';

import '../Model/product.dart';

class ShopViewModel extends ChangeNotifier {
  Map<Product, int> productsQuantity = <Product, int>{};

  //Fold make a verification if the list is empty and return an initial value if empty
  double get totalPrice =>  productsQuantity.keys.fold(0, (value, product) => (product.price * productsQuantity[product]!) + value);

  void addProduct(Product product){
    productsQuantity.addEntries([MapEntry(product, 1)]);
    notifyListeners();
  }

  void removeProduct(Product product){
    if(productsQuantity.containsKey(product)){
      productsQuantity.remove(product);
      notifyListeners();
    }
  }

  void upQuantity(Product product){
    productsQuantity[product] = productsQuantity[product]! + 1;
    notifyListeners();
  }

  void downQuantity(Product product){
    productsQuantity[product] = productsQuantity[product]! - 1;
    notifyListeners();
  }
}