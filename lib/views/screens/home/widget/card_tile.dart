import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardTile extends StatefulWidget {
  const CardTile({super.key});

  @override
  State<CardTile> createState() => _CardTileState();
}

class _CardTileState extends State<CardTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'https://img.freepik.com/premium-photo/isolated-pizza-with-mushrooms-olives_219193-8149.jpg?w=740',
            width: 350.w,
            height: 250.h,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Text(
              'The Fort Bar & Kitchen',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 0.h),
                  child: Container(
                    width: 5.0,
                    height: 5.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                  ),
                ),
                SizedBox(width: 8.w),
                const Text('Pizza'),
                SizedBox(width: 10.w),
                Padding(
                  padding: EdgeInsets.only(bottom: 0.h),
                  child: Container(
                    width: 5.0,
                    height: 5.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                  ),
                ),
                SizedBox(width: 8.w),
                const Text('Pasta'),
                SizedBox(width: 10.w),
                Padding(
                  padding: EdgeInsets.only(bottom: 0.h),
                  child: Container(
                    width: 5.0,
                    height: 5.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                  ),
                ),
                SizedBox(width: 8.w),
                const Text('Burger'),
                SizedBox(width: 10.w),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Row(
              children: [
                const Icon(
                  Icons.punch_clock,
                  color: Colors.red,
                ),
                SizedBox(width: 5.w),
                Text(
                  '20-30 Min',
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(width: 10.w),
                Padding(
                  padding: EdgeInsets.only(bottom: 0.h),
                  child: Container(
                    width: 5.0,
                    height: 5.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                  ),
                ),
                SizedBox(width: 8.w),
                const Text('4 Km'),
                SizedBox(width: 30.w),
                const Text('Rs 250 for One'),
              ],
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
