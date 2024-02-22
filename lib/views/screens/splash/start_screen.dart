import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:zapizza/views/screens/auth/login_screen.dart';
import 'package:zapizza/views/screens/entrypoints.dart';
import 'package:zapizza/views/widgets/rounded_button.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            children: [
              Lottie.network(
                  'https://lottie.host/e8d11e9b-d8f4-4182-8859-94888a2029eb/wQMd4ux1sP.json'),
              SizedBox(height: 30.h),
              Text(
                'Grab Your Delicious food',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Text(
                'Your One Stop Shop For All Your Food Needs From The Top Restaurant',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
              SizedBox(height: 200.h),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RoundedButton(
                      title: 'Sign Up/In',
                      onTap: () {
                        Get.to(() => const LoginScreen());
                      },
                    ),
                    RoundedButton(
                      title: 'Skip',
                      onTap: () {
                        Get.to(() => MainScreen());
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
