import 'package:flutter/material.dart';
import 'package:zapizza/common/helpers/cache_helpers.dart';
import 'package:zapizza/services/firebase_services.dart';
import 'package:zapizza/utils/user_constant.dart';

class AuthProvider extends ChangeNotifier {
  Future<void> logUserOut() async {
    await FirebaseServices.logOut();
    await CacheHelper.remove('user_id');
    UserConstants.userId = '';
  }
}
