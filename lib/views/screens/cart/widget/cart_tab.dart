import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              height: 250.h,
              width: 400.w,
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
                        height: 70.h,
                        width: 70.w,
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
                            height: 50.h,
                            width: 50.w,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/starbucks.png"))),
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
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "#264100",
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.orange.shade800,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Estimated Arrival",
                        style: TextStyle(color: Colors.black38),
                      ),
                      Text(
                        "Now",
                        style: TextStyle(color: Colors.black38),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "25 ",
                        style: TextStyle(color: Colors.black, fontSize: 20.sp),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "min",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "Food on the way",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500),
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
                          "Cancel",
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
                          "Track Order",
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
