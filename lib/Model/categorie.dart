import 'package:cloud_firestore/cloud_firestore.dart';

class Categorie {

  String? id;
  String name;

  Categorie({this.id, required this.name});

  factory Categorie.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    var result = data['categorie'];
    return Categorie(id: result['id'], name: result['name']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name
    };
  }
}