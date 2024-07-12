import 'package:flutter/material.dart';
import 'package:flymenu/services/categories_services.dart';

class CategoriesViewModel extends ChangeNotifier {

  CategoriesService categoriesService = CategoriesService();

  late String _categorieText;

  String get categorieText => _categorieText;

  set categorieText(String text){
    _categorieText = text;
    notifyListeners();
  }

  CategoriesViewModel(){
    categorieText = "";
    categoriesService.update = () => notifyListeners();
  }

   void onItemChange(int index){
    for(var categorie in categoriesService.categories.collection){
      categorie.isSelected = categorie == categoriesService.categories.collection[index];
    }

    updateText();
    notifyListeners();
   }

  void updateText(){
    categorieText = categoriesService.categories.collection.firstWhere((x) => x.isSelected).name;
  }

  void updateCategorie(){
    var list = categoriesService.categories.collection;
    if(list.isNotEmpty && !list.any((x) => x.isSelected)){
      list.first.isSelected = true;
      updateText();
    }

    notifyListeners();
  }
}