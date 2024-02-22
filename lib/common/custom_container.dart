import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zapizza/constants/constants.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  Widget containerContent;
  double? containerHieght;
  Color? color;
  CustomContainer({
    super.key,
    required this.containerContent,
    this.color,
    this.containerHieght,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: containerHieght ?? MediaQuery.of(context).size.height * 0.75,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
        child: Container(
          width: width,
          color: color ?? kOffWhite,
          child: SingleChildScrollView(
            child: containerContent,
          ),
        ),
      ),
    );
  }
}
