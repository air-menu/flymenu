import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flymenu/Model/categorie.dart';
import 'package:flymenu/Repository/interface_repository.dart';

class CategorieRepository implements IRepository<Categorie> {

  static const collectionName = "Categories";

  late FirebaseFirestore _firestore;

  CategorieRepository(FirebaseFirestore instance) { _firestore = instance; }

  /// Delete the Categorie item
  @override
  Future<void> delete(Categorie item) async {
    try {
      await _firestore.collection(collectionName).doc(item.id).delete();
    } catch (e) {
      throw Exception('Error deleting Categorie: $e');
    }
  }

  /// Allow to get all Categorie from firestore database
  @override
  Future<List<Categorie>> getAll() async {
    try{
      var result = await _firestore.collection(collectionName).get();
      return result.docs.map((doc) => Categorie.fromFirestore(doc)).toList();
    } catch(e){
      throw Exception('Error load all Categories : $e');
    }
  }

  /// Allow to get only one Categorie from the id
  @override
  Future<Categorie?> getByID(String id) async {
    try {
      var doc = await _firestore.collection(collectionName).doc(id).get();
      return doc.exists ? Categorie.fromFirestore(doc) : null;
    }catch (e) {
      throw Exception('Error Categorie with this id : $id not found, error : $e');
    }
  }

  /// Allow to add Categorie to the collection
  @override
  Future<void> insert(Categorie item) async {
    try {
      await _firestore.collection(collectionName).doc(item.id).set(item.toMap());
    }
    catch (e) {
      throw Exception('Error, the Categorie can t be added, error : $e');
    }
  }

  /// Allow to update the Categorie
  @override
  Future<void> update(Categorie item) async {
    try {
      await _firestore.collection(collectionName).doc(item.id).update(item.toMap());
    }
    catch (e) {
      throw Exception('Error the Categorie cannot be updated $e');
    }
  }

}