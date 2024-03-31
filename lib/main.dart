import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:zapizza/common/helpers/cache_helpers.dart';
import 'package:zapizza/controllers/banner_controller.dart';
import 'package:zapizza/controllers/tab_index_controller.dart';
import 'package:zapizza/firebase_options.dart';
import 'package:zapizza/provider/auth_provider.dart';
import 'package:zapizza/provider/cart_provider.dart';
import 'package:zapizza/provider/category_provider.dart';
import 'package:zapizza/provider/dish_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zapizza/constants/constants.dart';
import 'package:zapizza/provider/main_provider.dart';
import 'package:zapizza/views/screens/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => MainProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => DishDetailsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 825),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: kOffWhite,
            iconTheme: const IconThemeData(color: kDark),
            primarySwatch: Colors.grey,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const SplashScreen(),
          initialBinding: BindingsBuilder(() {
            Get.put<BannerController>(BannerController());
            Get.put<TabIndexController>(TabIndexController());
          }),
        );
      },
    );
  }
}
