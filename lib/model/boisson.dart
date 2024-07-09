import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flymenu/Model/product.dart';
import 'package:flymenu/Model/volumetric.dart';

import 'categorie.dart';

class Boisson extends Product
{
  Boisson({super.id ,required super.title, required super.description, required super.price, required super.imagePath, required super.categorie, required super.isHappyHour, required this.volumetrie, super.percentageReduce});

  List<Volumetric> volumetrie = [];

  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap();
    map['volumetrie'] = volumetrie.map((volume) => volume.toMap()).toList();
    return map;
  }

  /// Method for create the instance of product from datas from firestore
  factory Boisson.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Boisson(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      price: (data['price'] ?? 0.0).toDouble(),
      imagePath: data['imagePath'] ?? '',
      isHappyHour: data['isHappyHour'] ?? false,
      categorie: Categorie.fromFirestore(doc, isFromObject: true),
      volumetrie: (data["volumetrie"] as List)
          .map((item) => Volumetric.fromMap(item))
          .toList(),
    );
  }

}