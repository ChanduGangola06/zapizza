// ignore_for_file: avoid_unnecessary_containers
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zapizza/models/food_model.dart';
import 'package:zapizza/utils/shared.dart';
import 'package:zapizza/views/screens/home/food_detail_screen.dart';

class FavouriteItemCard extends StatelessWidget {
  final FoodModel dishModel;
  const FavouriteItemCard({super.key, required this.dishModel});

  @override
  Widget build(BuildContext context) {
    // log("${dishModel.imageUrl}");
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          navigateTo(
            context,
            page: FoodDetailsScreen(dish: dishModel),
          );
        },
        child: Card(
          color: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          shadowColor: const Color(0XFFF6F6F6),
          elevation: 6.5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network('${dishModel.imageUrl}',
                          width: 250.w, height: 250.h),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(EvaIcons.heartOutline)),
                  ],
                ),
                Container(
                  //constraints: const BoxConstraints(maxWidth: 200),
                  child: Text(
                    '${dishModel.name}',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  '${dishModel.category}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey,
                  ),
                ),
                const Spacer(),
                Text(
                  '₹ ${dishModel.price}',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
