import 'package:get/get.dart';

class TabIndexController extends GetxController {
  // ignore: prefer_final_fields
  RxInt _tabIndex = 0.obs;

  int get tabIndex => _tabIndex.value;

  set setTabIndex(int newValue) {
    _tabIndex.value = newValue;
  }
}
