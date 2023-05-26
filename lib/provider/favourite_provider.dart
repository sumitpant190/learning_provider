import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _selectedItems = [];

  List<int> get selectedItems => _selectedItems;

  void addItems(int val) {
    _selectedItems.add(val);
    notifyListeners();
  }

  void removeItems(int val) {
    _selectedItems.remove(val);
    notifyListeners();
  }
}
