import 'categorie.dart';

class Product {

  String title;
  String description;
  double price;
  String imagePath;
  bool isHappyHour;

  Categorie categorie;

  Product({
    required this.title,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.categorie,
    required this.isHappyHour
  });
}