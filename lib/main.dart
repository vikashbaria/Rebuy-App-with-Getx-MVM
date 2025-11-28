import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebay/controllers/auth_controller/auth_controller.dart';
import 'package:rebay/controllers/bottom_navigation/bottom_nav_controller.dart';
import 'package:rebay/controllers/home_controller/home_controller.dart';
import 'package:rebay/firebase_options.dart';
import 'package:rebay/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rebay/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthController());
  Get.put(BottomNavController());
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
      title: 'Rebay with Getx',
      initialRoute: AppPages.initail,
      getPages: AppPages.routes,
    );
  }
}
