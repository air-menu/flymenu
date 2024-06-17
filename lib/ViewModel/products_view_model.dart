import 'package:flutter/material.dart';

import '../Model/product.dart';

class ProductsViewModel extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product item){
    _products.add(item);
    notifyListeners();
  }

  void removeProduct(Product item){
    _products.remove(item);
    notifyListeners();
  }

  void updateProduct(Product newProduct, Product oldProduct){
    final index = _products.indexOf(oldProduct);
    _products[index] = newProduct;
    notifyListeners();
  }

}