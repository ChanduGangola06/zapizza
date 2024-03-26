import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zapizza/views/screens/cart/widget/cart_tab.dart';
import 'package:zapizza/views/screens/cart/widget/cart_tab2.dart';

class OrderTab1 extends StatelessWidget {
  const OrderTab1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CartTab(),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text(
                      "Lastest Order",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              const CartTab2()
            ],
          ),
        ));
  }
}
