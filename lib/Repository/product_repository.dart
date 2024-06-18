import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flymenu/Model/product.dart';
import 'package:flymenu/Repository/interface_repository.dart';

class ProductRepository implements IRepository<Product> {

  static const collectionName = "Products";

  late FirebaseFirestore _firestore;

  ProductRepository(FirebaseFirestore instance) { _firestore = instance; }

  /// Delete the product item
  @override
  Future<void> delete(Product item) async {
    try {
      await _firestore.collection(collectionName).doc(item.id).delete();
    } catch (e) {
      throw Exception('Error deleting product: $e');
    }
  }

  /// Allow to get all product from firestore database
  @override
  Future<List<Product>> getAll() async {
    try{
      var result = await _firestore.collection(collectionName).get();
      return result.docs.map((doc) => Product.fromFirestore(doc)).toList();
    } catch(e){
      throw Exception('Error load all products : $e');
    }
  }

  /// Allow to get only one product from the id
  @override
  Future<Product?> getByID(String id) async {
    try {
      var doc = await _firestore.collection(collectionName).doc(id).get();
      return doc.exists ? Product.fromFirestore(doc) : null;
    }catch (e) {
      throw Exception('Error product with this id : $id not found, error : $e');
    }
  }

  /// Allow to add product to the collection
  @override
  Future<void> insert(Product item) async {
    try {
      await _firestore.collection(collectionName).doc(item.id).set(item.toMap());
    }
    catch (e) {
      throw Exception('Error, the product can t be added, error : $e');
    }
  }

  /// Allow to update the product
  @override
  Future<void> update(Product item) async {
    try {
      await _firestore.collection(collectionName).doc(item.id).update(item.toMap());
    }
    catch (e) {
      throw Exception('Error the product cannot be updated $e');
    }
  }

}