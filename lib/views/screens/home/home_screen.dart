import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zapizza/views/screens/home/widget/card_tile.dart';
import 'package:zapizza/views/screens/home/widget/category.dart';
import 'package:zapizza/views/screens/home/widget/nearest.dart';
import 'package:zapizza/views/widgets/search_input.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100.h,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 20.h, left: 30.w, right: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Home',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5.w),
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'F-1 Shop No 12 Sector',
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_1_outlined),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w),
          child: Column(
            children: [
              const SearchInput(),
              SizedBox(height: 5.h),
              Text(
                'What\'s on your find?',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10.h),
              const Category(),
              const NearestCat(),
              SizedBox(height: 10.h),
              const CardTile(),
              SizedBox(height: 10.h),
              const CardTile(),
              SizedBox(height: 10.h),
              const CardTile(),
              SizedBox(height: 10.h),
              const CardTile(),
              SizedBox(height: 10.h),
              const CardTile(),
            ],
          ),
        ),
      ),
    );
  }
}
