import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zapizza/common/custom_container.dart';
import 'package:zapizza/constants/constants.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h),
          child: Container(
            height: 130,
          )),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Container(),
        ),
      ),
    );
  }
}
