import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zapizza/views/screens/auth/login_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/avatar.png"),
                      radius: 40,
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ZaPizza",
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          "zapizza@gmail.com",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      title: Text(
                        "My Orders",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                      leading: Container(
                        height: 25,
                        width: 25,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/myorders.png"))),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     PageTransition(
                        //         type: PageTransitionType.rightToLeft,
                        //         child: OrderPage()));
                      },
                    ),
                    ListTile(
                      title: Text(
                        "My Profile",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                      leading: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/myprofile.png"))),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text(
                        "Delivery Address",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                      leading: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/deliveryaddress.png"))),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     PageTransition(
                        //         type: PageTransitionType.rightToLeft,
                        //         child: AddressScreen()));
                      },
                    ),
                    ListTile(
                      title: Text(
                        "Payment Method",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                      leading: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/paymentmethod.png"))),
                      ),
                      // onTap: () {
                      //   Navigator.push(context,
                      //       MaterialPageRoute(builder: (BuildContext context) {
                      //     return OrderPage();
                      //   }));
                      // },
                    ),
                    ListTile(
                      title: Text(
                        "Contact Us",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                      leading: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/contactus.png"))),
                      ),
                      onTap: () {
                        // Add your navigation logic here
                        Navigator.pop(context); // Close the drawer
                      },
                    ),
                    ListTile(
                      title: Text(
                        "Setting",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                      leading: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/setting.png"))),
                      ),
                      onTap: () {
                        // Add your navigation logic here
                        Navigator.pop(context); // Close the drawer
                      },
                    ),
                    ListTile(
                      title: Text(
                        "Helps",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                      leading: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/helps.png"))),
                      ),
                      onTap: () {
                        // Add your navigation logic here
                        Navigator.pop(context); // Close the drawer
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.offAll(() => const LoginScreen());
                        },
                        child: Container(
                          height: 45,
                          width: 120,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 240, 99, 18),
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(children: [
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 30,
                              width: 35,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: const Icon(
                                Icons.login,
                                color: Colors.orange,
                                size: 20,
                              ),
                            ),
                            Text(
                              "  Log out",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
