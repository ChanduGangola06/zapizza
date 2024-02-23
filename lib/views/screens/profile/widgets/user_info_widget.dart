import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:zapizza/common/app_style.dart';
import 'package:zapizza/common/reusable_text.dart';
import 'package:zapizza/constants/constants.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.07,
      width: width,
      color: kLightWhite,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12.w, 0, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 40.h,
                      width: 40.w,
                      child: const CircleAvatar(
                        backgroundColor: kGrayLight,
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Padding(
                      padding: EdgeInsets.all(4.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            text: "Rohit Singh",
                            style: appStyle(14, kGray, FontWeight.w600),
                          ),
                          ReusableText(
                            text: "rohitsingh@gmail.com",
                            style: appStyle(12, kGray, FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Feather.edit,
                      color: kGray,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
