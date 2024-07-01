import 'categorie.dart';
import 'product.dart';

class FoodMenu {

  String id;
  List<Categorie> menuCategories;
  List<Product> products;

  FoodMenu({
    required this.id,
    required this.menuCategories,
    required this.products
  });

}