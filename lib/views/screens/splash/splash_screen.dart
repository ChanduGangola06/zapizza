import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:zapizza/provider/category_provider.dart';
import 'package:zapizza/provider/food_provider.dart';
import 'package:zapizza/utils/toast_message.dart';
import 'package:zapizza/views/screens/entrypoints.dart';

import 'package:zapizza/views/screens/splash/start_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    movetoNextScreen();
  }

  movetoNextScreen() async {
    Future.delayed(const Duration(seconds: 0), () {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          Provider.of<CategoryProvider>(context, listen: false)
              .fetchCategories();
          Provider.of<FoodProvider>(context, listen: false).getFoods();
          Get.offAll(() => const MainScreen());
          ToastMessage().toastMessage('Logged in Successfully!');
        });
      } else {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          Provider.of<CategoryProvider>(context, listen: false)
              .fetchCategories();
          Provider.of<FoodProvider>(context, listen: false).getFoods();
          Get.offAll(() => const StartScreen());
          ToastMessage().toastMessage('Please Login!');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/playstore.png',
                width: 250.w, height: 250.h)
            .animate()
            .fadeIn(duration: 600.ms)
            .then(delay: 200.ms)
            .slide(),
      ),
    );
  }
}
