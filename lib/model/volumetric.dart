import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flymenu/Model/selectable.dart';

class Volumetric extends Selectable {
  
  double value;
  String unit;

  Volumetric({required this.value, required this.unit}) {
    super.name = "$value $unit";
  }

  factory Volumetric.fromFirestore(DocumentSnapshot doc,
      {bool isFromObject = false}) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    if (isFromObject) {
      var result = data['volumetrie'];
      return Volumetric(value: result['value'], unit: data['unit']);
    }
    else {
      return Volumetric(value: data['value'], unit: data['unit']);
    }
  }

  factory Volumetric.fromMap(String volume) {
    var splitString = volume.split(" ");
    return Volumetric(
        value: double.parse(splitString[0]),
        unit: splitString[1]
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'unit': unit
    };
  }
}