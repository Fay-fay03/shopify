import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/Routes/routes.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override 
  State<SplashScreen> createState() => _splashState();
}
class _splashState extends State<SplashScreen>{
  @override

  void initState() {
    super.initState();
    _navigatetohome();
  }
  _navigatetohome()async {
    await Future.delayed(const Duration(milliseconds: 1800), () {
      Get.toNamed(AppRoutes.onboardpage);
      print("navigating to onboardpage..");
    });
  }

  Widget build(BuildContext context){
    return const Scaffold(
      body:  Center(
        child: SizedBox(
          child:Image(
                image: AssetImage("assets/images/Splash.png"),
              ),
        ),
      ),
    );
  }
}
