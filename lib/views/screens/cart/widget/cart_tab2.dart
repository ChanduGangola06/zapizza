import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartTab2 extends StatelessWidget {
  const CartTab2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(31, 102, 101, 101),
                        blurRadius: 20,
                        spreadRadius: 1,
                        offset: Offset(10, 20)),
                  ]),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(31, 102, 101, 101),
                              blurRadius: 20,
                              spreadRadius: 1,
                              offset: Offset(10, 20),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/jimmyjohns.png"))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "3 Items",
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.black54),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "StarBucks",
                              style: TextStyle(
                                  fontSize: 17.sp, fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 63, 231, 69),
                                  ),
                                ),
                                Text(
                                  "   Order Delivered",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color.fromARGB(
                                          255, 63, 231, 69),
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "\$17.10",
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.orange.shade800,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(31, 97, 97, 97),
                                  spreadRadius: 1,
                                  blurRadius: 20,
                                  offset: Offset(0, 20)),
                            ]),
                        alignment: Alignment.center,
                        child: Text(
                          "Re-order",
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.black87),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade800,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(31, 97, 97, 97),
                                  spreadRadius: 1,
                                  blurRadius: 20,
                                  offset: Offset(0, 20)),
                            ]),
                        alignment: Alignment.center,
                        child: Text(
                          "Rate",
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
