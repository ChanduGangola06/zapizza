import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:zapizza/controllers/banner_controller.dart';
import 'package:zapizza/controllers/tab_index_controller.dart';
import 'package:zapizza/provider/category_provider.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zapizza/constants/constants.dart';
import 'package:zapizza/views/screens/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
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
