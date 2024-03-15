import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/features/onboarding/models/onboarding_info.dart';

class OnboardingController extends GetxController{
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == OnboardingPage.length-1;
  var pageController = PageController();
  forwardAct() {
    if(isLastPage){
      
    }
    else{
    pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);}
  }
  List<OnboardingInfo> OnboardingPage = [
    OnboardingInfo('assets/images/Steps.png', 
    'Congratulation for taking a step into the future of stock management', 
    'The stock management app transforms workflows by digitizing and streamlining product information, eliminating manual record-keeping.'),
    OnboardingInfo('assets/images/Install.png', 
    'Stay Ahead with Instant Stock Alerts', 
    'Get notified instantly about low stock levels, enabling you to manage your inventory efficiently and keep your business running smoothly.'),

    OnboardingInfo('assets/images/happy.png', 
    'Effortless Joy in Stock Management', 
    'Enjoy effortless stock control with our user-friendly app, turning every task into a breeze and bringing joy to your inventory management routine.'),
  ];
}