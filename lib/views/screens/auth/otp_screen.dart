import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';
import 'package:zapizza/constants/constants.dart';
import 'package:zapizza/provider/login_provider.dart';
import 'package:zapizza/views/widgets/rounded_button.dart';

class OtpScreen extends StatefulWidget {
  final String vid;
  const OtpScreen({super.key, required this.vid});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController txtOTP = TextEditingController();
  var code = '';

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Consumer<LoginProvider>(builder: (context, value, child) {
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
                const Text(
                  "Verify your Mobile",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: secondary,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.02,
                ),
                const Text(
                  "Enter your OTP code here",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: gray, fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: gray,
                  focusedBorderColor: kPrimary,
                  textStyle: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700),
                  showFieldAsBox: false,
                  borderWidth: 4.0,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here if necessary
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {},
                ),
                SizedBox(
                  height: media.width * 0.25,
                ),
                RoundedButton(
                  title: 'Submit',
                  onTap: () {
                    value.signIn(id: widget.vid, code: code);
                    // Get.offAll(() => MainScreen());
                  },
                ),
              ],
            ),
          )),
        ),
      );
    });
  }
}
