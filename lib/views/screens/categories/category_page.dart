import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zapizza/common/app_style.dart';
import 'package:zapizza/common/back_ground_container.dart';
import 'package:zapizza/common/reusable_text.dart';
import 'package:zapizza/common/shimmers/foodlist_shimmer.dart';
import 'package:zapizza/constants/constants.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kDark,
          ),
          color: kGray,
        ),
        title: ReusableText(
          text: "Category",
          style: appStyle(13, kGray, FontWeight.w600),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: SizedBox(
          height: height,
          child: const FoodsListShimmer(),
        ),
      ),
    );
  }
}
