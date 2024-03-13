import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zapizza/provider/login_provider.dart';
import 'package:zapizza/views/widgets/line_textfiel.dart';
import 'package:zapizza/views/widgets/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtMobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
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
                  style:
                      TextStyle(fontSize: 14.sp, color: Colors.grey.shade500),
                ),
                SizedBox(height: 50.h),
                buildTextField(
                  "Enter Your Mobile Number",
                  "Mobile",
                  "user",
                  (value) {},
                ),
                SizedBox(height: 100.h),
                value.isLoginLoading
                    // ignore: avoid_unnecessary_containers
                    ? Container(
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedButton(
                            title: 'Submit',
                            onTap: () {
                              value.sendcode(phoneNumber: txtMobile);
                            },
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
