import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/common_widgets/buttonWidget.dart';
import 'package:untitled/common_widgets/custom_textformfield.dart';
import 'package:untitled/consts/consts.dart';

import '../../consts/colors.dart';
import '../../model/user_model.dart';
import '../workout_screens/workoutScreen.dart';

class AboutYou extends StatefulWidget {
  final AddUserModel userData;

  const AboutYou({Key? key, required this.userData}) : super(key: key);

  @override
  State<AboutYou> createState() => _AboutYouState();
}

class _AboutYouState extends State<AboutYou> {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Step 1: Create GlobalKey<FormState>

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: lightGrey,
        body: Form( // Step 2: Wrap form widgets with Form widget
          key: _formKey, // Step 2: Assign the created GlobalKey<FormState>
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: (context.screenHeight * 0.05)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tell us about you',
                  style: TextStyle(
                    fontFamily: semibold,
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(height: 40),
              CustomTextField(
                type: TextFieldType.number,
                controller: ageController,
                title: 'Age',
                hint: 'Enter your age',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a age';
                  }
                  return null; // Return null if the input is valid
                },
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Gender',
                  style: TextStyle(
                    color: fontBlack,
                    fontWeight: FontWeight.w400,
                    fontFamily: semibold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 5),
              // Gender Dropdown
              // CustomTextField for height
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      type: TextFieldType.number,
                      controller: heightController,
                      title: 'Height',
                      hint: 'Enter your height',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter height';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: CustomTextField(
                      type: TextFieldType.number,
                      controller: weightController,
                      title: 'Weight',
                      hint: 'Enter your weight',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a weight';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                  ),
                ],
              ),
             // SizedBox(height: 10),
              Spacer(),
              ButtonWidget(
                title: 'Next',
                color: skyColor,
                onPress: () {
                  // Step 3: Validate the form before navigating to the next screen
                  if (_formKey.currentState!.validate()) {

                    widget.userData.age = int.parse(ageController.text);
                    widget.userData.height = double.parse(heightController.text);
                    widget.userData.weight = double.parse(weightController.text);

                    Get.to(() => WorkoutScreen(userData: widget.userData));
                  }
                },
              ).box.width(context.screenWidth - 55).make(),
              SizedBox(height: 15),
            ],
          ).box.padding(EdgeInsets.all(20)).make(),
        ),
      ),
    );
  }
}
