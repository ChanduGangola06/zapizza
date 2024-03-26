import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zapizza/constants/constants.dart';
import 'package:zapizza/views/screens/auth/wrapper.dart';
import 'package:zapizza/views/widgets/rounded_button.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

class OtpScreen extends StatefulWidget {
  final String number;
  final String code;

  const OtpScreen({super.key, required this.number, required this.code});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController txtOTP = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String vId = "";
  var otpCode = "";

  @override
  void initState() {
    super.initState();
    onSendSms();
  }

  onSendSms() async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: "${widget.code} ${widget.number}",
        timeout: const Duration(seconds: 5),
        verificationCompleted: (PhoneAuthCredential credential) async {
          // ANDROID ONLY!

          // Sign the user in (or link) with the auto-generated credential
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (error) {
          Get.snackbar("Fail", error.toString());
        },
        codeSent: (verificationId, forceResendingToken) {
          vId = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          vId = verificationId;
        },
      );
    } catch (e) {
      Get.snackbar("Fail", e.toString());
    }
  }

  void smsVerification() async {
    if (otpCode.length < 6) {
      Get.snackbar("Error", "Please enter valid code");
      return;
    }

    try {
      final AuthCredential credential =
          PhoneAuthProvider.credential(verificationId: vId, smsCode: otpCode);

      final User? user = (await auth.signInWithCredential(credential)).user;

      if (user != null) {
        Get.offAll(() => const Wrapper());
      } else {
        Get.snackbar("Fail", "invalid otp");
      }
    } catch (e) {
      Get.snackbar("Fail", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: SizedBox(
          width: media.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: kPrimary,
                  ),
                ),
              ),
              Text(
                "Verify your Mobile",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: secondary,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Enter your OTP code here",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: gray, fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10.h,
              ),
              OtpTextField(
                numberOfFields: 6,
                borderColor: gray,
                focusedBorderColor: kPrimary,
                textStyle:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                showFieldAsBox: false,
                borderWidth: 4.0,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  otpCode = code;
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  otpCode = verificationCode;
                  smsVerification();
                },
              ),
              SizedBox(
                height: 50.h,
              ),
              RoundedButton(
                title: 'Submit',
                onTap: () {
                  smsVerification();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OtpTimerButton(
                    height: 60,
                    onPressed: () {
                      onSendSms();
                    },
                    text: const Text(
                      'Resend OTP',
                      style: TextStyle(fontSize: 16),
                    ),
                    buttonType: ButtonType.text_button,
                    backgroundColor: Colors.orange,
                    duration: 60,
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
