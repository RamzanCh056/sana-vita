// Import necessary packages and files
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/consts/consts.dart';

import '../../common_widgets/boxWidget.dart';
import '../../consts/images.dart'; // Importing images file again (redundant)

// Define a Train class which is a StatelessWidget
class Train extends StatefulWidget {
  const Train({super.key});

  @override
  State<Train> createState() => _TrainState();
}

class _TrainState extends State<Train> {
  // Constructor

  bool _isVisible = false;
  final List trainList = [
    atHomeNo,
    atGym,
    outDoor,
    atHomeYes,
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
                child: train.text
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
                    trainList.length,
                    (index) => StatefulBuilder(
                          builder: (BuildContext context,
                              void Function(void Function()) setState) {
                            return Column(
                              children: [
                                // Widget to display a BoxWidget with a title and icon
                                BoxWidget(
                                  title: trainList[index].toString(),
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
                                          ? 'Fitness routines performed in the comfort of one\'s home, offering convenience, flexibility, and effectiveness through bodyweight exercises, resistance bands, and minimal equipment'
                                          : index == 1
                                              ? 'Fitness sessions conducted in a gym environment, utilizing a variety of equipment such as weights, machines, and cardio gear, under the guidance of professionals, for comprehensive workouts and targeted muscle development.'
                                              : index == 2
                                                  ? 'Physical activities performed in natural environments like parks, trails, or open spaces, offering fresh air, diverse terrain, and the freedom to engage in activities like running, hiking, cycling, and bodyweight exercises.'
                                                  : 'Exercise routines tailored for home environments, requiring minimal space and equipment, providing convenience, privacy, and the flexibility to adapt to personal schedules and preferences',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                                20.heightBox,
                                // Widget to add vertical space
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

            //
            // Center(
            //   child: Column(
            //     children: [
            //       BoxWidget(title: atHomeNo,icon:(icArrow),width:(context.screenWidth-40)), // Widget to display a BoxWidget
            //       20.heightBox, // Widget to add vertical space
            //       BoxWidget(title: atGym,icon:(icArrow),width:(context.screenWidth-40)), // Widget to display a BoxWidget
            //       20.heightBox, // Widget to add vertical space
            //       BoxWidget(title: outDoor,icon:(icArrow),width:(context.screenWidth-40)), // Widget to display a BoxWidget
            //       20.heightBox, // Widget to add vertical space
            //       BoxWidget(title: atHomeYes,icon:(icArrow),width:(context.screenWidth-40)), // Widget to display a BoxWidget
            //     ],
            //   ),
            // )
          ],
        ).box.make(), // Wrapping the Column in a Box and making it
      ),
    );
  }
}
