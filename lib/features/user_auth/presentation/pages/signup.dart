import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/utils/Routes/routes.dart';
import 'package:shopify/utils/widget/textbutton.dart';

import '../../../../utils/constants/constant_page.dart';
import '../../../../utils/widget/form_container_widget.dart';
import '../../user_auth_controller/signup_controller.dart';


class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(builder: (signupController) {
      return Scaffold(
        appBar: AppBar(
            title: const Center(
          child: Text(
            "SignUp",
            style: TextStyle(
                color: whiteColor,
                fontWeight: titleFontWeight,
                fontSize: titleFontSize),
          ),
        )),
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Center(
              child: Padding(
              padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/account.png"),
                const Text("Create Account",
                style: TextStyle(color: blackcolor,
                fontSize: headingFontSize,
                fontWeight: headingFontWeight
                ),
                ),
                const SizedBox(height: 30,),
                FormContainerWidget(
                  controller: signupController.usernameController,
                  hintText: "Username",
                  isPasswordField: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                FormContainerWidget(
                  controller: signupController.emailController,
                  hintText: "Email",
                  isPasswordField: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                FormContainerWidget(
                  controller: signupController.passwordController,
                  hintText: "password",
                  isPasswordField: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      signupController.signUp();
                       //Get.toNamed(AppRoutes.home);
                    },
                    child: Center(
                      child:signupController.isSignUp ? 
                      const CircularProgressIndicator(color: whiteColor,)
                       :const Text("SignUp",
                       style: TextStyle(color: whiteColor, 
                       fontSize: titleFontSize,
                       fontWeight: titleFontWeight
                       ),
                       ))
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    const SizedBox(
                      width: 2,
                    ),
                    CustomTextButton(
                      onPressed: () {
                        Get.offAllNamed(AppRoutes.login);
                      },
                      text: "Login",
                    )
                  ],
                )
              ],
            ),
          )),
        ),
      );
    });
  }
}
