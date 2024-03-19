// Import necessary packages and files
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/consts/strings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../common_widgets/boxWidget.dart';
import '../../consts/images.dart';
import '../../consts/styles.dart'; // Importing images file again (redundant)

// Define a Diet class which is a StatelessWidget
class Diet extends StatefulWidget {
  const Diet({super.key});

  @override
  State<Diet> createState() => _DietState();
}

class _DietState extends State<Diet> {
  // Constructor
  bool _isVisible = false;
  final List dietList = [
    lowCrab,
    highProtein,
    ketoDiet,
    veg,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            (context.screenHeight * 0.04).heightBox,
            // Widget to add vertical space
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: diet.text
                    .size(25)
                    .fontFamily(bold)
                    .make(), // Widget to display text
              ),
            ),
            (context.screenHeight * 0.02).heightBox,
            // Widget to add vertical space
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                    dietList.length,
                    (index) => StatefulBuilder(
                          builder: (BuildContext context,
                              void Function(void Function()) setState) {
                            return Column(
                              children: [
                                // Widget to display a BoxWidget with a title and icon
                                BoxWidget(
                                  title: dietList[index].toString(),
                                  icon: (icArrow),
                                  width: (context.screenWidth - 40),
                                  onTap: () {
                                    setState(() {
                                      _isVisible = !_isVisible;
                                    });
                                  },
                                  requireWidget: Visibility(
                                    visible: _isVisible,
                                    child: Text(
                                      index == 0
                                          ? 'A dietary approach emphasizing reduced intake of carbohydrates, often preferred for managing blood sugar levels or achieving weight loss goals.'
                                          : index == 1
                                              ? 'A nutritional strategy focused on increasing protein consumption, vital for muscle growth, satiety, and overall body function optimization'
                                              : index == 2
                                                  ? 'A low-carbohydrate, high-fat eating plan designed to induce ketosis, a metabolic state where the body burns fat for fuel, leading to weight loss and enhanced mental clarity.'
                                                  : 'A dietary lifestyle excluding meat and fish, focusing on plant-based foods such as fruits, vegetables, grains, legumes, nuts, and seeds for nutrition and sustainability',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                                20.heightBox, // Widget to add vertical space
                              ],
                            );
                          },
                        )),

                //
                //
                //
                // // Widget to display a BoxWidget with a title and icon
                // BoxWidget(title: lowCrab,icon:(icArrow),width:(context.screenWidth-40)),
                // 20.heightBox, // Widget to add vertical space
                // // Widget to display a BoxWidget with a title and icon
                // BoxWidget(title: highProtein,icon:(icArrow),width:(context.screenWidth-40)),
                // 20.heightBox, // Widget to add vertical space
                // // Widget to display a BoxWidget with a title and icon
                // BoxWidget(title: ketoDiet,icon:(icArrow),width:(context.screenWidth-40)),
                // 20.heightBox, // Widget to add vertical space
                // // Widget to display a BoxWidget with a title and icon
                // BoxWidget(title: veg,icon:(icArrow),width:(context.screenWidth-40)),
              ),
            ),
          ],
        ).box.make(), // Wrapping the Column in a Box and making it
      ),
    );
  }
}
