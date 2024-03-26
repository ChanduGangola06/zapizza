// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zapizza/controllers/tab_index_controller.dart';
import 'package:zapizza/utils/colors.dart';
import 'package:zapizza/utils/helper_function.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TabIndexController>();
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          animationDuration: const Duration(seconds: 3),
          selectedIndex: controller.selectedMenu.value,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.black
              : Colors.white,
          elevation: 0,
          indicatorColor: THelperFunctions.isDarkMode(context)
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          onDestinationSelected: (index) =>
              controller.selectedMenu.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Iconsax.heart), label: 'Favourite'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Cart'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedMenu.value]),
    );
  }
}
