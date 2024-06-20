import 'dart:math';

import 'package:flutter/cupertino.dart';

class ObservableCollection<T> extends ChangeNotifier {

  final List<T> _collection = [];

  List<T> get collection => _collection;

  void add(T item) {
    _collection.add(item);
    notifyListeners();
  }

  void addAll(List<T> items){
    _collection.addAll(items);
    notifyListeners();
  }

  void delete(T item){
    _collection.remove(item);
    notifyListeners();
  }

  void update(T item){
    if(_collection.contains(item)){
      int index = _collection.indexOf(item);
      _collection[index] = item;
      notifyListeners();
    }
    else {
      throw Exception("L'item n'est pas contenu dans la liste");
    }
  }
}