import 'dart:async';
import 'dart:math';

import 'package:flymenu/Model/boisson.dart';
import 'package:flymenu/Model/volumetric.dart';

import '../../Model/categorie.dart';
import '../../Model/product.dart';

class MemoryData {
  final List<Categorie> categories = [];
  final List<Product> products = [];

  MemoryData(){
    var random = Random();

    var c1 = Categorie(id: '1', name: 'Foods');
    var c2 = Categorie(id: '2',name: 'Drinks');
    var c3 = Categorie(id: '3',name: 'Alcool');

    categories.addAll([c1,c2,c3]);

    var volumetrie = [
      Volumetric(value: 25, unit: "cl"),
      Volumetric(value: 50, unit: "cl"),
      Volumetric(value: 1.5, unit: "L"),
    ];

    Product p1 = Product(
      id: '120',
      title: 'Spaghettis bolognèse',
      description: 'De bonne pâtes italiennes',
      price: 10.0,
      imagePath: 'https://media.istockphoto.com/id/182924845/fr/photo/spaghetti-%C3%A0-la-bolognaise-avec-feuilles-de-basilic.jpg?s=612x612&w=0&k=20&c=fd6x1RttnwWorHEqmw6nt3SDV6PHmMkH0S1qDw60Qk4=',
      categorie: c1,
      isHappyHour: random.nextBool(),
      percentageReduce: 10
    );

    Product p2 = Boisson(
      id: '121',
      title: 'Coca cola',
      description: 'Bon soda',
      price: 15.0,
      imagePath: 'https://media.istockphoto.com/id/458464735/fr/photo/coca-cola.jpg?s=612x612&w=0&k=20&c=UXHbDVUkKx_ecmeStYOURnO9nizDrVaCr7BoM207V3w=',
      categorie: c2,
      isHappyHour: random.nextBool(),
      volumetrie: volumetrie,
      percentageReduce: 20
    );

    Product p3 = Boisson(
      id: '122',
      title: 'Vodka',
      description: 'C chaud',
      price: 20.0,
      imagePath: 'https://media.istockphoto.com/id/1204751751/fr/vectoriel/maquette-de-bouteille-de-vodka-disolement-avec-l%C3%A9tiquette-de-texte-mod%C3%A8le-demballage.jpg?s=612x612&w=0&k=20&c=oPGVrW-SQZsYq8cX3BCo-eUXwJE8iPOZ4qk6MIhyGbc=',
      categorie: c3,
      isHappyHour: random.nextBool(),
      volumetrie: volumetrie,
      percentageReduce: 30
    );

    Product p4 = Product(
      id: '123',
      title: 'Pizza bonnes',
      description: 'Bonnes Pizza',
      price: 25.0,
      imagePath: 'https://media.istockphoto.com/id/1389527253/fr/photo/pizza-v%C3%A9g%C3%A9tarienne-au-dessus-de-la-vue-minimaliste-sur-fond-bleu.jpg?s=612x612&w=0&k=20&c=F6K9qcfZAkpww0UtPRw6ZzMwcYCC1Wt4EuFm-408Hqc=',
      categorie: c1,
      isHappyHour: random.nextBool(),
      percentageReduce: 5
    );

    Product p5 = Boisson(
      id:'124',
      title: 'Oasis',
      description: 'C est bon',
      price: 30.0,
      imagePath: 'https://selfdrinks.com/30678-thickbox_default/oasis-tropical-2l.jpg',
      categorie: c2,
      isHappyHour: random.nextBool(),
      volumetrie: volumetrie,
      percentageReduce: 10
    );

    products.addAll([p1,p2,p3,p4,p5]);
  }
}