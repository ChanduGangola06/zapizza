import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zapizza/common/shimmers/homepage_shimmer.dart';
import 'package:zapizza/provider/main_provider.dart';
import 'package:zapizza/utils/shared.dart';
import 'package:zapizza/utils/user_constant.dart';
import 'package:zapizza/views/screens/home/food_detail_screen.dart';
import 'package:zapizza/views/screens/home/widget/favourite_item_card.dart';
import 'package:zapizza/views/screens/home/widget/lunch_item_card.dart';
import 'package:zapizza/views/widgets/banner_widget.dart';
import 'package:zapizza/views/widgets/category_widget.dart';
import 'package:zapizza/views/widgets/dashboard_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final MainProvider _main = UserConstants.mainProvider(context);

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
          // const Icon(Icons.shopping_bag_outlined, size: 25),
          // SizedBox(width: 10.w),
          const Icon(Icons.notification_add_outlined, size: 25),
          SizedBox(width: 20.w)
        ],
      ),
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height - 200,
              child: const HomePageShimmer(),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        child: DashboardTextField(),
                      ),
                      SizedBox(height: 10.h),
                      const BannerArea(),
                      SizedBox(height: 20.h),
                      const CategoryWidget(),
                      SizedBox(height: 10.h),
                      const SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: RichText(
                          text: const TextSpan(
                            text: 'Favorite',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: '  dishes',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        height: UserConstants.mediaQuery(context).height * 0.48,
                        child: ListView.builder(
                          itemCount: _main.dishesList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => FavouriteItemCard(
                            dishModel: _main.dishesList[index],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      //Popular Items Text
                      //
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          'Popular Foods',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.sp,
                          ),
                        ),
                      ),

                      SizedBox(height: 10.h),
                      SizedBox(
                        child: ListView.builder(
                          itemCount:
                              UserConstants.mainProvider(context, listen: true)
                                  .dishesList
                                  .length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                navigateTo(
                                  context,
                                  page: FoodDetailsScreen(
                                    dish: _main.dishesList[index],
                                  ),
                                );
                              },
                              child: LunchItemCard(
                                dishModel: UserConstants.mainProvider(context,
                                        listen: true)
                                    .dishesList[index],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
