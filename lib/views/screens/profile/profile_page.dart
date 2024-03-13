import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:zapizza/common/custom_button.dart';
import 'package:zapizza/common/custom_container.dart';
import 'package:zapizza/views/screens/profile/widgets/profile_app_bar.dart';
import 'package:zapizza/views/screens/profile/widgets/profile_tile_widget.dart';
import 'package:zapizza/views/screens/profile/widgets/user_info_widget.dart';
import 'package:zapizza/views/screens/splash/start_screen.dart';

import '../../../constants/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: const ProfileAppBar(),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              const UserInfoWidget(),
              SizedBox(height: 10.h),
              Container(
                height: 210.h,
                decoration: const BoxDecoration(color: kLightWhite),
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ProfileTileWidget(
                      onTap: () {
                        //Get.to(() => const LoginRedirect());
                      },
                      title: "My Orders",
                      icon: Ionicons.fast_food_outline,
                    ),
                    ProfileTileWidget(
                      onTap: () {},
                      title: "My Favorite Places",
                      icon: Ionicons.heart_outline,
                    ),
                    ProfileTileWidget(
                      onTap: () {},
                      title: "Review",
                      icon: Ionicons.chatbubble_outline,
                    ),
                    ProfileTileWidget(
                      onTap: () {},
                      title: "Coupons",
                      icon: MaterialCommunityIcons.tag_outline,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                height: 210.h,
                decoration: const BoxDecoration(color: kLightWhite),
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ProfileTileWidget(
                      onTap: () {},
                      title: "Shipping Address",
                      icon: SimpleLineIcons.location_pin,
                    ),
                    ProfileTileWidget(
                      onTap: () {},
                      title: "Sevice Center",
                      icon: AntDesign.customerservice,
                    ),
                    ProfileTileWidget(
                      onTap: () {},
                      title: "Coupons",
                      icon: MaterialIcons.rss_feed,
                    ),
                    ProfileTileWidget(
                      onTap: () {},
                      title: "Settings",
                      icon: AntDesign.setting,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                onTap: () {
                  Get.offAll(() => const StartScreen());
                },
                btnWidth: 90,
                btnHeight: 40,
                btnColor: kRed,
                text: "Logout",
                radius: 10.r,
              )
            ],
          ),
        ),
      ),
    );
  }
}
