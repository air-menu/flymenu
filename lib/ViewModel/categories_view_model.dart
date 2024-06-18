import 'package:flutter/material.dart';
import 'package:flymenu/Model/categorie.dart';

class CategoriesViewModel extends ChangeNotifier {

  List<Categorie> categories = [
    Categorie(id:'1', name: 'Drinks'),
    Categorie(id:'2', name: 'Foods'),
    Categorie(id:'3', name: 'Others')
  ];

}