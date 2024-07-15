import 'menu.dart';

class Restaurant {
  String id;
  String name;
  String address;
  bool isOpen;
  List<FoodMenu> menus;
  String? phoneNumber;
  String? website;
  String? imageUrl;
  String? description;

  Restaurant({
    required this.id,
    required this.name,
    required this.address,
    required this.isOpen,
    required this.menus,
     this.phoneNumber,
    this.website,
    this.imageUrl,
    this.description,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    // Exemple de parsing JSON pour créer une instance de Restaurant
    return Restaurant(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      isOpen: json['isOpen'],
      menus: (json['menus'] as List<dynamic>)
          .map((menuJson) => FoodMenu.fromJson(menuJson))
          .toList(),
      phoneNumber: json['phoneNumber'],
      website: json['website'],
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    // Convertir Restaurant en JSON
    return {
      'id': id,
      'name': name,
      'address': address,
      'isOpen': isOpen,
      'menus': menus.map((menu) => menu.toJson()).toList(),
      'phoneNumber': phoneNumber,
      'website': website,
      'imageUrl': imageUrl,
      'description': description,
    };
  }
}