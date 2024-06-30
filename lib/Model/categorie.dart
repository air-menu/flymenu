import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flymenu/Model/selectable.dart';

class Categorie extends Selectable {

  String? id;

  Categorie({this.id, required String name}) {
    super.name = name;
  }

  factory Categorie.fromFirestore(DocumentSnapshot doc, {bool isFromObject = false}) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    if(isFromObject){
      var result = data['categorie'];
      return Categorie(id: result['id'], name: result['name']);
    }
    else{
      return Categorie(id: data['id'], name: data['name']);
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name
    };
  }
}