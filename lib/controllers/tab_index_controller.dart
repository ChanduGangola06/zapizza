import 'package:get/get.dart';
import 'package:zapizza/views/screens/cart/cart_page.dart';
import 'package:zapizza/views/screens/favourite/favourite_page.dart';
import 'package:zapizza/views/screens/home/home_screen.dart';
import 'package:zapizza/views/screens/profile/profile_page.dart';

class TabIndexController extends GetxController {
  // ignore: prefer_final_fields
  final Rx<int> selectedMenu = 0.obs;

  final screens = const [
    HomeScreen(),
    FavouritePage(),
    CartPage(),
    ProfilePage(),
  ];
}
