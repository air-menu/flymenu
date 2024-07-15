import 'categorie.dart';
import 'product.dart';

class FoodMenu {
  String id;
  String? title;
  List<Categorie> menuCategories;
  List<Product> products;

  FoodMenu({
    required this.id,
    required this.menuCategories,
    required this.products,
    this.title,
  });

  factory FoodMenu.fromJson(Map<String, dynamic> json) {
    var menuCategoriesList = <Categorie>[];
    var productsList = <Product>[];

    // Parsing menuCategories
    if (json['menuCategories'] != null) {
      var categoryJsonList = json['menuCategories'] as List<dynamic>;
      menuCategoriesList = categoryJsonList.map((categoryJson) => Categorie(name: categoryJson['name'])).toList();
    }

    // Parsing products
    if (json['products'] != null) {
      var productJsonList = json['products'] as List<dynamic>;
      productsList = productJsonList.map((productJson) => Product(
        id: productJson['id'],
        title: productJson['title'],
        description: productJson['description'],
        price: productJson['price'].toDouble(),
        imagePath: productJson['imagePath'],
        isHappyHour: productJson['isHappyHour'],
        categorie: Categorie(name: productJson['categorie']['name']),
        percentageReduce: productJson['percentageReduce'],
      )).toList();
    }

    return FoodMenu(
      id: json['id'],
      title: json['title'],
      menuCategories: menuCategoriesList,
      products: productsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'menuCategories': menuCategories.map((category) => {'name': category.name}).toList(),
      'products': products.map((product) => {
        'id': product.id,
        'title': product.title,
        'description': product.description,
        'price': product.price,
        'imagePath': product.imagePath,
        'isHappyHour': product.isHappyHour,
        'categorie': {'name': product.categorie.name},
        'percentageReduce': product.percentageReduce,
      }).toList(),
    };
  }
}
