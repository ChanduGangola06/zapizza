import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zapizza/common/app_style.dart';
import 'package:zapizza/common/reusable_text.dart';
import 'package:zapizza/constants/constants.dart';
import 'package:zapizza/constants/ui_data.dart';
import 'package:zapizza/views/screens/home/widget/food_tile.dart';

import '../../../common/back_ground_container.dart';

class RecommendationsPage extends StatelessWidget {
  const RecommendationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: ReusableText(
            text: "Recommendations",
            style: appStyle(13, kLightWhite, FontWeight.w600)),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: ListView(
            children: List.generate(foods.length, (i) {
              var food = foods[i];
              return FoodTile(
                food: food,
              );
            }),
          ),
        ),
      ),
    );
  }
}
