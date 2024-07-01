import 'package:cloud_firestore/cloud_firestore.dart';

import '../Helper/observable_collection.dart';
import '../Model/categorie.dart';
import '../Model/menu.dart';
import '../Model/product.dart';
import '../Repository/categorie_repository.dart';

class CategoriesService {

  CategorieRepository repository = CategorieRepository(FirebaseFirestore.instance);

  ObservableCollection<Categorie> categories = ObservableCollection<Categorie>();

  Function()? update;
  static final CategoriesService _instance = CategoriesService._privateConstructor();

  factory CategoriesService() => _instance;

  CategoriesService._privateConstructor(){
    repository.categoriesStream.listen((listCategorie) {
      categories.collection.clear();
      categories.addAll(listCategorie);
      update?.call();
    });
  }

  static List<Product> filterByCategories(FoodMenu menu, String name) {
    return menu.products.where((element) => element.categorie.name == name).toList();
  }
}