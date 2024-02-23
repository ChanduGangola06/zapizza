import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zapizza/constants/colors.dart';

Widget buildTextField(String hintText, String textType, String iconName,
    void Function(String value)? func) {
  return Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.only(top: 0.h, bottom: 0.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.w)),
          border: Border.all(color: AppColors.primaryFourthElementText)),
      child: Row(
        children: [
          Container(
            width: 16.w,
            margin: EdgeInsets.only(left: 17.w),
            height: 16.w,
            child: Image.asset("assets/icons/$iconName.png"),
          ),
          SizedBox(
            width: 270.w,
            height: 50.h,
            child: TextField(
              onChanged: (value) => func!(value),
              keyboardType: const TextInputType.numberWithOptions(),
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
              ],
              decoration: InputDecoration(
                hintText: hintText,
                labelText: 'Phone Number',
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                hintStyle: const TextStyle(
                    color: AppColors.primarySecondaryElementText),
              ),
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp),
              autocorrect: false,
            ),
          )
        ],
      ));
}
