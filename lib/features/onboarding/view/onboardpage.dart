import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shopify/utils/Routes/routes.dart';
import '../../../utils/constants/constant_page.dart';
import '../controllers/onboarding_controller.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatelessWidget{
  OnboardingPage({Key? key}) : super(key: key);
  final _controller = OnboardingController();

  @override

  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
              const Positioned(
                top: 90,
                left: 160,
                child: Text("STOCKY",
                style: TextStyle(color: blackcolor, fontSize: headingFontSize,fontWeight: headingFontWeight),
                )),
            PageView.builder(
              onPageChanged: _controller.selectedPageIndex,
              controller: _controller.pageController,
              itemCount: _controller.OnboardingPage.length,
              itemBuilder: (context, index){
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Image.asset(_controller.OnboardingPage[index].imageAsset),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: Text(_controller.OnboardingPage[index].title,
                    style: const TextStyle(color: blackcolor, 
                    fontSize: titleFontSize, 
                    fontWeight: titleFontWeight,
                    ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(_controller.OnboardingPage[index].description,
                  style: const TextStyle(color: descriptioncolor, 
                  fontSize: normalTextFontSize, 
                  fontWeight: normalTextFontWeight,
                  ),
                  )
                ]) ,
              );
            }),
            Positioned(
              bottom: 110,
              left: 150,
              child: Row(
                children: List.generate(
                  _controller.OnboardingPage.length, 
                  (index) => Obx(() {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: _controller.selectedPageIndex.value == index ? skipcolor : indicatorcolor,
                          shape:BoxShape.circle
                        ),
                      );
                    }
                  ))
              ),
            ),
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: TextButton(
                    child: Obx((){
                      return Text(_controller.isLastPage ? "" :"Skip",
                  style: const TextStyle(color: skipcolor, 
                  fontSize: textFontSize, fontWeight: normalTextFontWeight),
                  );
                    }), onPressed: () {
                      Get.toNamed(AppRoutes.login);
                    },),
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: ElevatedButton(
                    child: Obx((){
                      return Text(_controller.isLastPage ? "Get started" :"NEXT",
                  style: const TextStyle(color: buttontextcolor, 
                  fontSize: normalTextFontSize,fontWeight: titleFontWeight)
                  );}), onPressed: () {
                    if (_controller.isLastPage) {
                      Get.offAllNamed(AppRoutes.login); // Navigate to login page
                     } else {
                      _controller.forwardAct(); // Move to the next onboarding page
                    }
                  },)
                  ),
          ],
        ),
      ),
    );
  }
}