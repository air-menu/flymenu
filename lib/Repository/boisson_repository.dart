import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flymenu/Model/boisson.dart';
import 'package:flymenu/Repository/product_repository.dart';

class BoissonRepository extends ProductRepository {

  @override
  Stream<List<Boisson>> get productStream =>
      firestore.collection(collectionName).snapshots().map((querySnapshot) {
        return querySnapshot.docs.map((doc) => Boisson.fromFirestore(doc)).toList();
      });

  BoissonRepository(FirebaseFirestore instance) : super(instance, "Boissons");

}