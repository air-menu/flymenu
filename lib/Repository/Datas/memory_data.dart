import 'dart:math';

import '../../Model/categorie.dart';
import '../../Model/product.dart';

class MemoryData {
  final List<Categorie> categories = [];
  final List<Product> products = [];

  MemoryData(){
    var random = Random();

    var c1 = Categorie(name: 'Foods');
    var c2 = Categorie(name: 'Drinks');
    var c3 = Categorie(name: 'Alcool');

    categories.addAll([c1,c2,c3]);

    Product p1 = Product(
      id: '120',
      title: 'Spaghettis bolognèse',
      description: 'De bonne pâtes italiennes',
      price: 10.0,
      imagePath: 'path1.jpg',
      categorie: c1,
      isHappyHour: random.nextBool(),
    );

    Product p2 = Product(
      id: '121',
      title: 'Coca cola',
      description: 'Bon soda',
      price: 15.0,
      imagePath: 'path2.jpg',
      categorie: c2,
      isHappyHour: random.nextBool(),
    );

    Product p3 = Product(
      id: '122',
      title: 'Vodka',
      description: 'C chaud',
      price: 20.0,
      imagePath: 'path3.jpg',
      categorie: c3,
      isHappyHour: random.nextBool(),
    );

    Product p4 = Product(
      id: '123',
      title: 'Pizza bonnes',
      description: 'Bonnes Pizza',
      price: 25.0,
      imagePath: 'path4.jpg',
      categorie: c1,
      isHappyHour: random.nextBool(),
    );

    Product p5 = Product(
      id:'124',
      title: 'Oasis',
      description: 'C est bon',
      price: 30.0,
      imagePath: 'path5.jpg',
      categorie: c2,
      isHappyHour: random.nextBool(),
    );

    products.addAll([p1,p2,p3,p4,p5]);
  }
}