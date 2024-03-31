import 'package:flutter/material.dart';
import 'package:zapizza/models/food_model.dart';
import 'package:zapizza/services/firebase_services.dart';

class MainProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  List<FoodModel> _dishesList = [];
  List<FoodModel> get dishesList => _dishesList;

  final List<String> _categoriesList = const [
    'All Food',
    'Pizza',
    'Pasta',
    'Drinks',
    'Other',
  ];

  List<String> get categoriesList => _categoriesList;

  void getFavoriteDishes() async {
    await FirebaseServices.getAllData('products').then((value) {
      for (var element in value.docs) {
        _dishesList.add(FoodModel.fromJson(element.data()));
      }
      debugPrint('--- ${_dishesList[0].id}');
    });
    notifyListeners();
  }

  void changeCurrentIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }
}
