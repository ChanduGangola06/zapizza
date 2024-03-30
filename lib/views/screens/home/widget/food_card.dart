import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zapizza/provider/food_provider.dart';

class FoodCard extends StatefulWidget {
  const FoodCard({super.key});

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FoodProvider>(
      builder: (context, value, child) {
        print("The data is${value.foodList}");

        return SizedBox(
          height: 240.h,

          // ListView.builder(
          //   scrollDirection: Axis.horizontal,
          //   shrinkWrap: true,
          //   physics: const BouncingScrollPhysics(),
          //   itemCount: value.foodList.length,
          //   itemBuilder: (context, index) {
          //     var foodItem = value.foodList[index];
          //     return Card(
          //       elevation: 4,
          //       margin: const EdgeInsets.all(8),
          //       child: Column(
          //         children: [
          //           Stack(
          //             children: [
          //               Image.network(
          //                 foodItem.imageUrl,
          //                 height: 150.h,
          //                 width: 150.w,
          //                 fit: BoxFit.cover,
          //               ),
          //               Positioned(
          //                 top: 8.h,
          //                 right: 8.h,
          //                 child: const Icon(Icons.favorite, color: Colors.red),
          //               ),
          //             ],
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.all(8),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   foodItem.productName,
          //                   style: const TextStyle(
          //                     fontSize: 18,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //                 const SizedBox(height: 4),
          //                 Text(
          //                   foodItem.description,
          //                   style: const TextStyle(
          //                     fontSize: 14,
          //                   ),
          //                 ),
          //                 const SizedBox(height: 8),
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Text(
          //                       '\$${foodItem.productPrice}',
          //                       style: const TextStyle(
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.bold,
          //                         color: Colors.green,
          //                       ),
          //                     ),
          //                     Text(
          //                       '${foodItem.discount}% OFF',
          //                       style: const TextStyle(
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.bold,
          //                         color: Colors.red,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     );
          //   },
          // ),
        );
      },
    );
  }
}
