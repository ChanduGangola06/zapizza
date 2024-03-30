import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zapizza/common/app_style.dart';
import 'package:zapizza/common/reusable_text.dart';
import 'package:zapizza/constants/constants.dart';
import 'package:zapizza/constants/zcolors.dart';
import 'package:zapizza/provider/category_provider.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, value, child) {
        return SizedBox(
          height: 100.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: List.generate(
              value.categories.length,
              (index) {
                var category = value.categories[index];
                bool isSelected = value.selectedIndices.contains(index);
                return Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: GestureDetector(
                    onTap: () {
                      value.toggleCategorySelection(index);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 5.w),
                      padding: EdgeInsets.only(top: 4.h),
                      width: width * 0.19,
                      decoration: BoxDecoration(
                        color: isSelected ? primaryColor : Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: primaryColor, width: .5.w),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60.h,
                            child: Image.network(
                              category.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          ReusableText(
                              text: category.categoryName,
                              style: appStyle(12, kDark, FontWeight.normal))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
