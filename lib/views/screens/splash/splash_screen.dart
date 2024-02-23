import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    movetoNextScreen();
  }

  movetoNextScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(() => const StartScreen());
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
