import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 50.h, left: 15.w, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter Tour Phone Number',
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              'Please Input Your Number To Verify',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade500),
            ),
            SizedBox(height: 50.h),
            const TextField(),
          ],
        ),
      ),
    );
  }
}
