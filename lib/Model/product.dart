import 'package:cloud_firestore/cloud_firestore.dart';

import 'categorie.dart';

class Product {

  String? id;
  String title;
  String description;
  double price;
  String imagePath;
  bool isHappyHour;

  Categorie categorie;

  Product({
    this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.categorie,
    required this.isHappyHour
  });

  /// Method for create the instance of product from datas from firestore
  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Product(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      price: (data['price'] ?? 0.0).toDouble(),
      imagePath: data['imagePath'] ?? '',
      isHappyHour: data['isHappyHour'] ?? false,
      categorie: Categorie.fromFirestore(doc, isFromObject: true),
    );
  }

  /// Method for create the document to send at Firebase
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'imagePath': imagePath,
      'isHappyHour': isHappyHour,
      'categorie' : categorie.toMap()
    };
  }
}