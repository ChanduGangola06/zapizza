import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zapizza/models/food_model.dart';

class FoodProvider extends ChangeNotifier {
  bool _isFoodLoading = false;
  List<FoodModel> _foodList = [];

  bool get isFoodLoading => _isFoodLoading;
  List get foodList => _foodList;

  Future<void> getFoods() async {
    try {
      _isFoodLoading = true;
      notifyListeners();
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('products').get();
      _foodList = querySnapshot.docs.map((doc) {
        return FoodModel(
          productName: doc['productName'],
          productPrice: doc['productPrice'],
          catgoryName: doc['categoryName'],
          imageUrl: doc['imageUrl'],
          quantity: doc['quantity'],
          productId: doc['productId'],
          productSize: doc['productSize'],
          discount: doc['discount'],
          description: doc['description'],
          storeId: doc['storeId'],
        );
      }).toList();
      log("The food items are : ------------$_foodList");
      _isFoodLoading = false;
      notifyListeners();
    } catch (e) {
      _isFoodLoading = false;
      notifyListeners();
    }
  }
}
