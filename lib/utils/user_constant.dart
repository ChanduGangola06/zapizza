import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapizza/provider/cart_provider.dart';
import 'package:zapizza/provider/dish_details_provider.dart';
import 'package:zapizza/provider/main_provider.dart';

import '../provider/auth_provider.dart';

class UserConstants {
  static String userId = '';
  static String pizza = 'assets/anime/pizza.json';
  static String pizzaBw = 'assets/anime/pizza_b&w.json';
  static String emptyCart = 'assets/anime/empty_cart.json';

  static MainProvider mainProvider(BuildContext context,
          {bool listen = false}) =>
      Provider.of<MainProvider>(context, listen: listen);

  static AuthProvider authProvider(BuildContext context,
          {bool listen = false}) =>
      Provider.of<AuthProvider>(context, listen: listen);

  static CartProvider cartProvider(BuildContext context,
          {bool listen = false}) =>
      Provider.of<CartProvider>(context, listen: listen);

  static DishDetailsProvider dishDetailsProvider(BuildContext context,
          {bool listen = false}) =>
      Provider.of<DishDetailsProvider>(context, listen: listen);

  static Size mediaQuery(BuildContext context) => MediaQuery.of(context).size;
}
