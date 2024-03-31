// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:zapizza/provider/cart_provider.dart';
import 'package:zapizza/services/payment_services.dart';
import 'package:zapizza/utils/user_constant.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    PaymentServices.initRazorPay();
  }

  @override
  void dispose() {
    PaymentServices.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Cart',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        if (_cart.cartList.isNotEmpty)
                          IconButton(
                            onPressed: () => _cart.emptyCart(),
                            // .whenComplete(
                            //       () => navigateAndRemove(
                            //         context,
                            //         page: const HomeScreen(),
                            //       ),
                            //     ),
                            icon: const Icon(
                              EvaIcons.trashOutline,
                              color: Colors.black,
                            ),
                          ),
                        // IconButton(
                        //   onPressed: () => Get.back(),
                        //   icon: const Icon(
                        //     EvaIcons.close,
                        //     color: Colors.black,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Body Orders
                SizedBox(
                  height: 250,
                  child: (Provider.of<CartProvider>(context, listen: true)
                          .cartList
                          .isEmpty)
                      ? Center(
                          child: Column(
                            children: [
                              Lottie.asset(
                                UserConstants.emptyCart,
                                height: 200,
                                width: 200,
                              ),
                              SizedBox(height: 20.h),
                              Text(
                                'Cart is Empty',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount:
                              Provider.of<CartProvider>(context, listen: true)
                                  .cartList
                                  .length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final _cartItemsList =
                                _cart.cartList.values.toList()[index];
                            return ListTile(
                              minVerticalPadding: 16,
                              leading: Card(
                                color: Colors.white,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child:
                                    Image.network(_cartItemsList.dishImageUrl!),
                              ),
                              title: Text(_cartItemsList.dishName!),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Size: ${_cartItemsList.size}'),
                                  Text('x${_cartItemsList.cheese} cheese'),
                                  if (_cartItemsList.onion!)
                                    const Text('x1 onion'),
                                  if (_cartItemsList.bacon!)
                                    const Text('x1 bacon'),
                                ],
                              ),
                              trailing: Column(
                                children: [
                                  Text('₹ ${_cartItemsList.dishPrice}'),
                                  const SizedBox(height: 5),
                                  Text(
                                      '${_cartItemsList.quantity.toString()}X'),
                                ],
                              ),
                            );
                          },
                        ),
                ),
                const Divider(),
                const SizedBox(height: 15),
                //BODY:INFO
                _cart.cartList.isNotEmpty
                    ? Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  // _buildCardTile(
                                  //   title: UserConstants.locationProvider(context,
                                  //           listen: true)
                                  //       .address,
                                  //   leadingIcon: EvaIcons.pinOutline,
                                  //   onEditPressed: () =>
                                  //       navigateTo(context, page: const MapScreen()),
                                  // ),
                                  const SizedBox(height: 5),

                                  _buildCardTile(
                                    title: _cart.time.format(context),
                                    leadingIcon: EvaIcons.clockOutline,
                                    onEditPressed: () => showTimePicker(
                                            context: context,
                                            initialTime: _cart.time)
                                        .then((time) {
                                      if (time != null) {
                                        _cart.changeDeliveryTime(time);
                                      }
                                    }),
                                  ),

                                  const SizedBox(height: 5),
                                  _buildCardTile(
                                    title: 'Cash',
                                    leadingIcon: EvaIcons.creditCardOutline,
                                    onEditPressed: () =>
                                        PaymentServices.checkOut(
                                            totalPrice: _cart.totalPrice),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(height: 30),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Subtotal',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '₹ ${_cart.totalPrice}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildText('Delivery fee'),
                        _buildText('₹ 10'),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          (_cart.totalPrice == 0)
                              ? '₹ 0'
                              : '₹ ${_cart.totalPrice + 10}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    // Center(
                    //   child: defaultButton(
                    //     title: 'Place Order',
                    //     onPressed: () =>
                    //         // Provider.of<CartProvider>(context, listen: false)
                    //         //     .makeOrder(
                    //         //       location: Provider.of<LocationProvider>(
                    //         //               context,
                    //         //               listen: false)
                    //         //           .address,
                    //         //       estimatedTime: _cart.time.format(context),
                    //         //       paymentMethod: 'cash',
                    //         //     )
                    //         //     .whenComplete(
                    //         //       () => navigateAndRemove(
                    //         //         context,
                    //         //         page: const HomeScreen(),
                    //         //       ),
                    //         //     ),
                    //   ),

                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _buildText(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
      ),
    );
  }

  Widget _buildCardTile(
          {String? title,
          IconData? leadingIcon,
          VoidCallback? onEditPressed}) =>
      ListTile(
        leading: Icon(
          leadingIcon,
          color: Colors.grey,
        ),
        title: Text('$title'),
        trailing: IconButton(
          onPressed: onEditPressed,
          icon: const Icon(
            EvaIcons.editOutline,
            color: Colors.black,
          ),
        ),
      );
}
