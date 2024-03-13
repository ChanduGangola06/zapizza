import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zapizza/views/screens/auth/otp_screen.dart';
import 'package:zapizza/views/screens/auth/wrapper.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoginLoading = false;
  bool _isOtpVerifyLoading = false;

  bool get isLoginLoading => _isLoginLoading;
  bool get isOtpVerifyLoading => _isOtpVerifyLoading;

  Future<void> sendcode({required var phoneNumber}) async {
    try {
      _isLoginLoading = true;
      notifyListeners();
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91 9876543210',
        verificationCompleted: (PhoneAuthCredential credentail) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String vid, int? token) {
          _isLoginLoading = false;
          notifyListeners();
          Get.to(
            () => OtpScreen(vid: vid),
          );
        },
        codeAutoRetrievalTimeout: (vid) {},
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error Occurred', e.code);
    } catch (e) {
      Get.snackbar('Error Occurred', e.toString());
    }
  }

  Future<void> signIn({required var id, required var code}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: id,
      smsCode: '123456',
    );

    try {
      _isOtpVerifyLoading = true;
      notifyListeners();
      await FirebaseAuth.instance.signInWithCredential(credential).then(
            (value) => Get.offAll(
              () => const Wrapper(),
            ),
          );
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error Occurred', e.code);
    } catch (e) {
      Get.snackbar('Error Occurred', e.toString());
    }
  }
}
