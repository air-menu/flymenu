import 'dart:math';

import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flymenu/Model/categorie.dart';
import 'package:flymenu/Model/product.dart';
import 'package:flymenu/Repository/Datas/memory_data.dart';
import 'package:flymenu/Repository/categorie_repository.dart';
import 'package:flymenu/Repository/product_repository.dart';

void main() async {

  final firestore = FakeFirebaseFirestore();
  var data = MemoryData();

  ProductRepository productRepository = ProductRepository(firestore);
  CategorieRepository categorieRepository = CategorieRepository(firestore);

  group("Test link with the database (Fake_cloud_Firestore)", () {
    setUpAll(() async {
      await productRepository.insert(data.products[4]);
    });
    test('Test Insert and Fetch data product', () async {
      final result = await productRepository.getAll();
      expect(result.length, 1);
    });

    test("Test update query", () async{
      var product = await productRepository.getByID('124');
      expect(product, isNotNull);

      var oldTitle = product?.title;
      product?.title = "Bolognaise";
      await productRepository.update(product!);
      var stringID = data.products[4].id;
      Product? newproduct = await productRepository.getByID(stringID!);
      
      expect(newproduct?.title, isNot(oldTitle));
    });

    test("Test remove query", () async {
      await productRepository.delete(data.products[4]);
      final result = await productRepository.getAll();

      expect(result.length, 0);
    });
  });

}