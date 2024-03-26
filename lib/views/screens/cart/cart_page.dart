import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zapizza/views/screens/orders/order_page.dart';
import 'package:zapizza/views/widgets/cart_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int quantityCount = 1;

  void decrementQuantity() {
    if (quantityCount > 1) {
      setState(() {
        quantityCount--;
      });
    }
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Cart",
            style: TextStyle(
              fontSize: 18.sp,
              color: const Color.fromARGB(255, 39, 39, 39),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 80.h,
        ),
        body: Column(
          children: [
            SizedBox(height: 20.h),
            const CartCard(),
            const CartCard(),
            SizedBox(height: 10.h),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Promo Code",
                      style: TextStyle(fontSize: 15.sp, color: Colors.black54),
                    ),
                    Container(
                      height: 45.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade800,
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Apply",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Text(
                    "Subtotal",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: const Color.fromARGB(255, 17, 17, 17),
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Text(
                    "₹ 27.30",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: const Color.fromARGB(255, 36, 36, 36),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Text(
                    "Subtotal",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: const Color.fromARGB(255, 17, 17, 17),
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Text(
                    "₹ 27.30",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: const Color.fromARGB(255, 36, 36, 36),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Text(
                    "Subtotal",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: const Color.fromARGB(255, 17, 17, 17),
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Text(
                    "₹ 27.30",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: const Color.fromARGB(255, 36, 36, 36),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const OrderPage());
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(95, 163, 163, 163),
                            spreadRadius: 1,
                            blurRadius: 30,
                            offset: Offset(00, 20))
                      ],
                      color: Colors.orange.shade800,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Checkout",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: const Color.fromARGB(221, 255, 255, 255),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
