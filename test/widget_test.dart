// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import "dart:math";

import 'package:flutter_test/flutter_test.dart';

import "package:flymenu/Model/restaurant.dart";
import "package:flymenu/Model/menu.dart";
import "package:flymenu/Model/categorie.dart";
import "package:flymenu/Model/product.dart";
import "package:flymenu/Services/categories_services.dart";

const String constDrink = 'Drinks';
const String constFoods = 'Foods';

List<Categorie> categories = [
  Categorie(id: '1' ,name: 'Starters', isSelected: true),
  Categorie(id: '2', name: constFoods),
  Categorie(id: '3', name: 'Desserts'),
  Categorie(id: '4', name: constDrink),
];

void main() {
  /*testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MainView());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });*/

  List<Product> products = [];
  Random random = Random();
  for (int i = 0; i < 20; i++) {
    products.add(
      Product(
        id: '1',
        title: 'Product ${i + 1}',
        description: 'Description for product ${i + 1}',
        price: 5.0 + random.nextDouble() * 20.0,
        imagePath: 'assets/product_${random.nextInt(5) + 1}.jpg',
        categorie: categories[random.nextInt(categories.length)],
        isHappyHour: random.nextBool()
      ),
    );
  }

  List<FoodMenu> menus = [];
  for (int i = 0; i < 10; i++) {
    menus.add(
      FoodMenu(
        id: '1',
        menuCategories: categories,
        products: products,
      ),
    );
  }

  List<Restaurant> restaurants = [];
  restaurants.add(
      Restaurant(
          id: '1',
          name: 'Restaurant le petit gibier',
          address: '124 chemin de la croisade',
          isOpen: true,
          menus: menus
      )
  );

  Restaurant currentRestaurant = restaurants.first;
  FoodMenu currentMenu = currentRestaurant.menus.first;
  
  group("Test Menu filter", () {
    test('Test that a list of products contains only drinks', () {
      // Obtention de la liste des boissons à partir de la liste de tous les produits
      List<Product> drinks = CategoriesService.filterByCategories(currentMenu, constDrink);

      // Vérification que la liste de boissons ne contient que des boissons
      expect(drinks.every((product) => product.categorie.name == constDrink), isTrue);
    });

    test('Test that a list of products contains only food', () {
      // Obtention de la liste des boissons à partir de la liste de tous les produits
      List<Product> foods = CategoriesService.filterByCategories(currentMenu, constFoods);

      // Vérification que la liste de boissons ne contient que des boissons
      expect(foods.every((product) => product.categorie.name == constFoods), isTrue);
    });
  });

  
}
