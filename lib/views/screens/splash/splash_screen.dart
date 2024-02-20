import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    moveToNextScreen();
  }

  moveToNextScreen() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.to(
          () => const StartScreen(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/playstore.png'),
      ),
    );
  }
}
