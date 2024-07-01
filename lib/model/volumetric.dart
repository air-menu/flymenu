import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flymenu/Model/selectable.dart';

class Volumetric extends Selectable {

  String? id;
  double value;
  String unit;

  Volumetric({this.id, required this.value, required this.unit}) {
    super.name = "$value $unit";
  }

  factory Volumetric.fromFirestore(DocumentSnapshot doc,
      {bool isFromObject = false}) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    if (isFromObject) {
      var result = data['volumetrie'];
      return Volumetric(
          id: result['id'], value: result['value'], unit: data['unit']);
    }
    else {
      return Volumetric(id: data['id'], value: data['value'], unit: data['unit']);
    }
  }

  factory Volumetric.fromMap(Map<String, dynamic> map) {
    return Volumetric(
        id: map['id'],
        value: map['value'],
        unit: map['unit']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'value': value,
      'unit': unit
    };
  }
}