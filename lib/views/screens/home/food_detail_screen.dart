// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:zapizza/models/food_model.dart';
import 'package:zapizza/provider/dish_details_provider.dart';
import 'package:zapizza/utils/shared.dart';
import 'package:zapizza/utils/user_constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodDetailsScreen extends StatelessWidget {
  final FoodModel dish;

  const FoodDetailsScreen({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    final Size _meidaQuery = UserConstants.mediaQuery(context);
    final DishDetailsProvider _dishDetailsProvider =
        UserConstants.dishDetailsProvider(context, listen: true);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 250.h,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.network('${dish.imageUrl}',
                              width: double.infinity, height: 400.h),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(
                                EvaIcons.close,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      children: [
                        Icon(
                          EvaIcons.star,
                          color: Colors.amber,
                        ),
                        SizedBox(width: 3),
                        Text(
                          '4.5',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${dish.name}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'with garlic',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '₹ ${dish.price}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Body
              Stack(
                children: [
                  SizedBox(
                    height: _meidaQuery.height * 0.73,
                    width: double.infinity,
                    child: Card(
                      color: Colors.white,
                      margin: const EdgeInsets.only(top: 25),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                      elevation: 1.5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 40),
                            const Text(
                              'Add more stuff',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 20),
                            _buildCounterRow(
                              title: 'Quantity',
                              counter: _dishDetailsProvider.quantity,
                              increment: () =>
                                  UserConstants.dishDetailsProvider(context)
                                      .changeQuantityValue(operation: 'i'),
                              decrement: () =>
                                  UserConstants.dishDetailsProvider(context)
                                      .changeQuantityValue(operation: 'd'),
                            ),
                            _buildCounterRow(
                              title: 'Cheese',
                              counter: _dishDetailsProvider.cheese,
                              increment: () =>
                                  UserConstants.dishDetailsProvider(context)
                                      .changeCheeseValue(operation: 'i'),
                              decrement: () =>
                                  UserConstants.dishDetailsProvider(context)
                                      .changeCheeseValue(operation: 'd'),
                            ),
                            const SizedBox(height: 10),
                            _buildIngredientsRow(
                              title: 'Onion',
                              ingredient: _dishDetailsProvider.onion,
                              onPressed: () =>
                                  UserConstants.dishDetailsProvider(context)
                                      .changeIngredients(ingredient: 'Onion'),
                            ),
                            const SizedBox(height: 10),
                            _buildIngredientsRow(
                              title: 'Bacon',
                              ingredient: _dishDetailsProvider.bacon,
                              onPressed: () =>
                                  UserConstants.dishDetailsProvider(context)
                                      .changeIngredients(ingredient: 'Bacon'),
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: defaultButton(
                                title: 'Add to Cart',
                                onPressed: () =>
                                    UserConstants.cartProvider(context).addItem(
                                  quantity: _dishDetailsProvider.quantity,
                                  size: _dishDetailsProvider
                                      .sizes[_dishDetailsProvider.currentIndex],
                                  dishModel: dish,
                                  cheese: _dishDetailsProvider.cheese,
                                  onion: _dishDetailsProvider.onion,
                                  bacon: _dishDetailsProvider.bacon,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  _buildSizeCards(_dishDetailsProvider),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: defaultFloatingActionButton(
        context,
        btnColor: Colors.white,
        badgeColor: const Color(0XFFFFC56A),
      ),
    );
  }

  Positioned _buildSizeCards(DishDetailsProvider _dishDetailsProvider) =>
      Positioned(
        top: 0,
        left: 80.w,
        right: 50,
        child: SizedBox(
          height: 60,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => UserConstants.dishDetailsProvider(context)
                  .changeCurrentIndex(index),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: (_dishDetailsProvider.currentIndex == index)
                      ? const Color(0xFFFFC56B)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: (_dishDetailsProvider.currentIndex == index)
                          ? const Color(0xFFFFEECB)
                          : Colors.black12,
                      blurRadius: 15,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Text(
                  _dishDetailsProvider.sizes[index],
                  style: (_dishDetailsProvider.currentIndex == index)
                      ? const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600)
                      : const TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            ),
          ),
        ),
      );

  Row _buildCounterRow(
      {required String title,
      required int counter,
      required VoidCallback increment,
      required VoidCallback decrement}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: decrement,
              icon: const Icon(EvaIcons.minus),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                counter.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            IconButton(
              onPressed: increment,
              icon: const Icon(EvaIcons.plus),
            ),
          ],
        ),
      ],
    );
  }

  Row _buildIngredientsRow({
    required String title,
    required bool ingredient,
    required VoidCallback onPressed,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          (ingredient)
              ? Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: GestureDetector(
                    onTap: onPressed,
                    child: const Text(
                      'Added',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: onPressed,
                        icon: const Icon(EvaIcons.plus),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'Add',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      );
}
