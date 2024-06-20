import 'package:flutter/material.dart';
import 'package:flymenu/Helper/observable_collection.dart';
import 'package:flymenu/Model/categorie.dart';

import '../Repository/Datas/memory_data.dart';

class CategoriesViewModel extends ChangeNotifier {

  ObservableCollection<Categorie> categories = ObservableCollection<Categorie>();

  late String _categorieText;

  String get categorieText => _categorieText;

  set categorieText(String text){
    _categorieText = text;
    notifyListeners();
  }

  CategoriesViewModel(){
    final MemoryData memoryData = MemoryData();
    categories.addAll(memoryData.categories);
    categories.collection.first.isSelected = true;
    updateText();
  }

   void onItemChange(int index){
    for(var categorie in categories.collection){
      categorie.isSelected = categorie == categories.collection[index];
    }

    updateText();
    notifyListeners();
   }

  void updateText(){
    categorieText = categories.collection.firstWhere((x) => x.isSelected).name;
  }


}