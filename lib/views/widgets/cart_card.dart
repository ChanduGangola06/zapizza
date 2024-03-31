import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartCard extends StatefulWidget {
  const CartCard({super.key});

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 120.h,
        width: 375.w,
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: SizedBox(
              height: 70.h,
              width: 70.w,
              child: Image.asset(
                "assets/images/restaurant_bk.png",
                height: 90.h,
                width: 90.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "Red n hot pizza",
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "Spicy Chickem, beef",
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Text(
                      "\$12.00",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.orange.shade800,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1),
                    ),
                    const SizedBox(
                      width: 90,
                    ),
                    Container(
                      width: 25.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.orange.shade700,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        onTap: decrementQuantity,
                        customBorder: const CircleBorder(),
                        child: Center(
                          child: Icon(
                            Icons.remove,
                            color: Colors.orange.shade700,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                      child: Center(
                        child: Text(
                          quantityCount.toString(),
                          style: TextStyle(
                              color: Colors.orange.shade700,
                              fontSize: 16.sp), // Adjust the font size
                        ),
                      ),
                    ),
                    Container(
                      width: 25.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                          color: Colors.orange.shade700,
                          border: Border.all(
                            color: Colors.orange.shade700,
                          ),
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 0,
                                offset: Offset(0, 08),
                                color: Color.fromARGB(148, 255, 128, 0))
                          ]),
                      child: InkWell(
                        onTap: incrementQuantity,
                        customBorder: const CircleBorder(),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
