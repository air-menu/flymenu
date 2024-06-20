import 'package:flymenu/Repository/categorie_repository.dart';

import '../Model/menu.dart';
import '../Model/product.dart';

class CategoriesService {

  static List<Product> filterByCategories(FoodMenu menu, String name) {
    return menu.products.where((element) => element.categorie.name == name).toList();
  }

}