import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/consts/consts.dart';
import '../../common_widgets/buttonWidget.dart';
import '../../common_widgets/custom_textformfield.dart';
import '../../consts/colors.dart';
import '../../model/user_model.dart';
import '../workout_screens/aboutYou.dart';
import 'loginScreen.dart';

// Screen for user signup
class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController  = TextEditingController();
  TextEditingController passwordController  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightGrey,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Spacer
                (context.screenHeight * 0.05).heightBox,
                // Signup text
                Align(
                  alignment: Alignment.centerLeft,
                  child: signup.text.fontFamily(semibold).size(22).make(),
                ),
                // Spacer
                40.heightBox,
                // Name text field
                CustomTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null; // Return null if the input is valid
                    },
                    controller: nameController,
                    title: name, hint: nameHint),
                // Email text field
                CustomTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a email';
                      }
                      return null; // Return null if the input is valid
                    },
                  controller: emailController,
                    title: email, hint: emailHint),
                10.heightBox,
                // Password text field
                CustomTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null; // Return null if the input is valid
                    },
                  controller: passwordController,
                    title: password, hint: passwordHint),
                // Confirm password text field
                // CustomTextField(
                //     title: confirmPassword, hint: passwordHint,
                //
                // ),
                20.heightBox,
                // Signup button
                ButtonWidget(
                  textColor: whiteColor,
                  title: signup,
                  color: skyColor,
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      AddUserModel userData = AddUserModel(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      Get.to(() => AboutYou(userData: userData));
                    }
                  },
                ).box.width(context.screenWidth - 55).make(),
                15.heightBox,
                // Already have an account text
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: alreadyAccount,
                        style: TextStyle(
                          fontFamily: bold,
                          color: fontGrey,
                        ),
                      ),
                      TextSpan(
                        text: login,
                        style: TextStyle(
                          fontFamily: bold,
                          color: skyColor,
                        ),
                      ),
                    ],
                  ),
                ).onTap(() {
                  Get.to(() => LoginScreen());
                }),
              ],
            ).box.padding(EdgeInsets.all(20)).make(),
          ),
        ),
      ),
    );
  }
}
