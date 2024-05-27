import 'menu.dart';

class Restaurant {
  String name;
  String address;
  bool isOpen;
  late List<FoodMenu> menus;

  Restaurant({
    required this.name,
    required this.address,
    required this.isOpen,
    required this.menus
  });
}