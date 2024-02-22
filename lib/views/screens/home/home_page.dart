import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zapizza/common/custom_appbar.dart';
import 'package:zapizza/common/custom_container.dart';
import 'package:zapizza/common/heading.dart';
import 'package:zapizza/constants/constants.dart';
import 'package:zapizza/views/screens/home/recommendations_page.dart';
import 'package:zapizza/views/screens/home/widget/category_list.dart';
import 'package:zapizza/views/screens/home/widget/food_list.dart';
import 'package:zapizza/views/screens/home/widget/nearby_restaurants_list.dart';

import 'all_fastest_foods_page.dart';
import 'all_nearby_restaurants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: const CustomAppBar(),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              const CategoryList(),
              Column(
                children: [
                  Heading(
                    text: "Try Something New",
                    onTap: () {
                      Get.to(() => const RecommendationsPage(),
                          transition: Transition.cupertino,
                          duration: const Duration(milliseconds: 900));
                    },
                  ),
                  const FoodsList(),
                  Heading(
                    text: 'Nearby Restaurants',
                    onTap: () {
                      Get.to(
                        () => const AllNearbyRestaurants(),
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 900),
                      );
                    },
                  ),
                  const NearbyRestaurants(),
                  Heading(
                    text: "Food closer to you",
                    onTap: () {
                      Get.to(() => const AllFastestFoods(),
                          transition: Transition.cupertino,
                          duration: const Duration(milliseconds: 900));
                    },
                  ),
                  const FoodsList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
