import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearestCat extends StatelessWidget {
  const NearestCat({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(Icons.filter_3_outlined),
              ),
            ),
          ),
          SizedBox(width: 5.w),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Nearest',
                  style: TextStyle(fontSize: 15.sp, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(width: 5.w),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Discount',
                  style: TextStyle(fontSize: 15.sp, color: Colors.black),
                ),
              ),
            ),
          ),
          SizedBox(width: 5.w),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Rating 4+',
                  style: TextStyle(fontSize: 15.sp, color: Colors.black),
                ),
              ),
            ),
          ),
          SizedBox(width: 5.w),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'New Arriving',
                  style: TextStyle(fontSize: 15.sp, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
