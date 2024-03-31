// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:zapizza/models/cart_model.dart';
import 'package:zapizza/models/food_model.dart';
import 'package:zapizza/services/firebase_services.dart';
import 'package:zapizza/utils/user_constant.dart';
import 'package:zapizza/views/screens/cart/cart_page.dart';

class CartProvider extends ChangeNotifier {
  Map<String, CartItemModel> _cartList = {};
  Map<String, CartItemModel> get cartList => _cartList;

  // ignore: prefer_final_fields
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay get time => _time;

  int get totalPrice {
    int _total = 0;
    _cartList.forEach((_, value) {
      _total += value.dishPrice! * value.quantity!;
    });
    return _total;
  }

  void addItem({
    required String size,
    required FoodModel dishModel,
    required int quantity,
    int? cheese,
    bool? onion,
    bool? bacon,
    bool? beef,
  }) async {
    // if (!modified!) {
    _cartList.putIfAbsent(
      dishModel.id!,
      () => CartItemModel(
        dishName: dishModel.name,
        dishImageUrl: dishModel.imageUrl,
        dishPrice: int.tryParse(dishModel.price!),
        quantity: quantity,
        size: size,
        cheese: cheese,
        onion: onion,
        bacon: bacon,
      ),
    );

    notifyListeners();
    Get.to(() => const CartPage());
  }

  Future<void> makeOrder({
    required String? location,
    required String? estimatedTime,
    required String? paymentMethod,
  }) async {
    String? _orderId = const Uuid().v4();
    final List<CartItemModel> _tempList = _cartList.values.toList();
    await FirebaseServices.saveData(
      collection: 'orders',
      id: _orderId,
      data: {
        'id': _orderId,
        'uid': UserConstants.userId,
        'location': location,
        'estimated_time': estimatedTime,
        'payment_method': paymentMethod,
        'cart_items': _tempList.map((e) => e.toJson()).toList(),
      },
    ).whenComplete(() {
      emptyCart();
    });
    notifyListeners();
  }

  Future<void> emptyCart() async {
    _cartList.clear();
    notifyListeners();
  }

  void changeDeliveryTime(TimeOfDay? tempTime) {
    _time = tempTime!;
    notifyListeners();
  }
}
