import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/utils/Routes/routes.dart';
import 'package:shopify/features/onboarding/view/onboardpage.dart';
import 'package:shopify/features/splash/splash_scren.dart';

import 'features/user_auth/presentation/pages/home.dart';
import 'features/user_auth/presentation/pages/login.dart';
import 'features/user_auth/presentation/pages/signup.dart';
import 'features/user_auth/user_auth_controller/login_controller.dart';
import 'features/user_auth/user_auth_controller/signup_controller.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    Get.put(LoginController());
    return GetMaterialApp(
      getPages: [
        GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
        GetPage(name: AppRoutes.onboardpage, page: () => OnboardingPage()),
        GetPage(name: AppRoutes.login, page: () => const LoginPage()),
        GetPage(name: AppRoutes.home, page: () => const HomePage()),
        GetPage(name: AppRoutes.signUp, page: () => SignUpPage())
      ],
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(       
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen()
    );
  }
}


