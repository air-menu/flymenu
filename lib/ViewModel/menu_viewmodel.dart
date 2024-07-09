import 'package:flutter/cupertino.dart';
import 'package:flymenu/Helper/observable_collection.dart';
import 'package:flymenu/Model/categorie.dart';
import 'package:flymenu/Model/product.dart';
import 'package:flymenu/Repository/Datas/memory_data.dart';

class MenuViewModel extends ChangeNotifier {

  ObservableCollection<Product> products = ObservableCollection<Product>();
  ObservableCollection<Categorie> categories = ObservableCollection<Categorie>();

  MenuViewModel(){
    products.collection.addAll(MemoryData().products);
    categories.collection.addAll(MemoryData().categories);
  }

}