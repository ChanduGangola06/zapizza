// ignore_for_file: prefer_final_fields, prefer_collection_literals, avoid_print

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zapizza/models/category_models.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> _categories = [];
  bool _isCategoryLoading = false;

  List<CategoryModel> get categories => _categories;
  bool get isCategoryLoading => _isCategoryLoading;

  Set<int> _selectedIndices = Set<int>();

  Set<int> get selectedIndices => _selectedIndices;

  void toggleCategorySelection(int index) {
    if (_selectedIndices.contains(index)) {
      _selectedIndices.remove(index);
    } else {
      _selectedIndices.add(index);
    }
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    try {
      _isCategoryLoading = true;
      notifyListeners();
      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('categories').get();
      _categories = querySnapshot.docs.map((doc) {
        return CategoryModel(
          image: doc['image'],
          categoryName: doc['categoryName'],
        );
      }).toList();
      _isCategoryLoading = false;
      notifyListeners();
    } catch (error) {
      print("Error fetching categories: $error");
      _isCategoryLoading = false;
      notifyListeners();
    }
  }
}
