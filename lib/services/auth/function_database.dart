import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flymenu/constants/user.constant.dart';

class FunctionDatabase {

  // Fonction pour récupérer le statut de l'inscription de l'utilisateur
  Future<bool> getAccountRegistered(String uid) async {
    try {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection(UserConstant.dbName).doc(uid).get();
      return userSnapshot.get(UserConstant.accountregistered) ?? false;
    } catch (e) {
      if (kDebugMode) {
        print('Error getting accountRegistered: $e');
      }
      return false;
    }
  }



}
