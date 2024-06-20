import 'package:flutter/cupertino.dart';
import 'package:flymenu/Helper/observable_collection.dart';
import 'package:flymenu/Model/product.dart';
import 'package:flymenu/Repository/Datas/memory_data.dart';

class ProductsViewModel extends ChangeNotifier {

  ObservableCollection<Product> products = ObservableCollection<Product>();

  ProductsViewModel(){
    final MemoryData memoryData = MemoryData();
    products.addAll(memoryData.products);
  }
}