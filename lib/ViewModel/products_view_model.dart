import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flymenu/Helper/observable_collection.dart';
import 'package:flymenu/Model/product.dart';
import 'package:flymenu/Repository/product_repository.dart';

class ProductsViewModel extends ChangeNotifier {

  ObservableCollection<Product> products = ObservableCollection<Product>();

  ProductRepository repository = ProductRepository(FirebaseFirestore.instance);

  ProductsViewModel(){
    repository.productStream.listen((listProduct) {
      products.collection.clear();
      products.addAll(listProduct);
      notifyListeners();
    });
  }
}