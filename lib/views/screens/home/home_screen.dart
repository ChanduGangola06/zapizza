import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zapizza/common/shimmers/homepage_shimmer.dart';
import 'package:zapizza/views/widgets/banner_widget.dart';
import 'package:zapizza/views/widgets/category_widget.dart';
import 'package:zapizza/views/widgets/dashboard_textfield.dart';
import 'package:zapizza/views/widgets/filter_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100.h,
        title: CircleAvatar(
          radius: 20.r,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.asset("assets/images/avatar.png"),
          ),
        ),
        actions: [
          const Icon(Icons.shopping_bag_outlined, size: 25),
          SizedBox(width: 10.w),
          const Icon(Icons.notification_add_outlined, size: 25),
          SizedBox(width: 20.w)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: Future.delayed(const Duration(seconds: 2)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height - 200,
                    child: const HomePageShimmer(),
                  );
                } else {
                  return Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DashboardTextField(),
                            Expanded(
                              child: FilterContainer(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      const BannerArea(),
                      SizedBox(height: 20.h),
                      const CategoryWidget(),
                      SizedBox(height: 10.h),
                      //Featured Restaurent Text
                      //TextRow02(),
                    ],
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
