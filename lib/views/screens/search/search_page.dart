import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:zapizza/common/custom_container.dart';
import 'package:zapizza/common/custom_textfield.dart';
import 'package:zapizza/constants/constants.dart';
import 'package:zapizza/views/screens/search/loading_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        toolbarHeight: 74.h,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: CustomTextWidget(
            controller: _searchController,
            keyboardType: TextInputType.text,
            hintText: "Search For Foods",
            suffixIcon: GestureDetector(
              onTap: () {},
              child: Icon(Ionicons.search_circle, size: 40.h, color: kPrimary),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: CustomContainer(
          color: Colors.white,
          containerContent: const LoadingWidget(),
        ),
      ),
    );
  }
}
