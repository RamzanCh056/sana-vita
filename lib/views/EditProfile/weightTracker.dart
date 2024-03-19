import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/consts/consts.dart';
import '../../consts/colors.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'addWeightScreen.dart';

class WeightTracker extends StatefulWidget {
  const WeightTracker({Key? key}) : super(key: key);

  @override
  State<WeightTracker> createState() => _WeightTrackerState();
}

class _WeightTrackerState extends State<WeightTracker> {
  double margin = 32;
  List<int> items = [20, 35, 20, 55, 70, 55, 65];
  List items1 = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  int selected = 0;
  String? valueChoose;
  List<String> listItem=["Mon","Tue","Wed","Thu","Fri","Sat","Sun"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = ((size.width - margin) - ((items.length + 1) * 30)) / items.length;

    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          color: lightGrey,
          child: Column(
            children: [
              75.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Weight Tracker".text.size(23).fontFamily(semibold).make(),
                    Container(
                      decoration: BoxDecoration(
                        color: skyColor.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      child: DropdownButton<String>(
                        hint: Text("Week"),
                        value: valueChoose,
                        onChanged: (newValue) {
                          setState(() {
                            valueChoose = newValue!;
                          });
                        },
                        items: listItem.map((valueItem) {
                          return DropdownMenuItem<String>(
                            value: valueItem,
                            child: Text(valueItem,style: TextStyle(fontSize: 10),),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              40.heightBox,
              Container(
                width: Get.width,
                height: 240,
                padding: EdgeInsets.only(left: 18,top: 20),
                margin: EdgeInsets.symmetric(horizontal: 13),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent.withOpacity(.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          for (int i = 0; i < items.length; i++)
                            Container(
                              width: width,
                              height: items.elementAt(i) * 250 / 110,
                              margin: EdgeInsets.only(right: 31.5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                color: (selected == i ? Colors.grey : Colors.blue),
                              ),
                            )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        for (int i = 0; i < items1.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Text(
                              items1[i],
                              style: TextStyle(fontSize: 11, color: darkFontGrey, decoration: TextDecoration.none),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 170,
                padding: EdgeInsets.only(left: 18),
                margin: EdgeInsets.symmetric(horizontal: 13),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent.withOpacity(.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: "your progress".text.size(17).fontFamily(regular).make(),
                      ),
                      30.heightBox,
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              "Current".text.color(Colors.grey).make(),
                              "Left".text.color(Colors.grey).make(),
                              "Target".text.color(Colors.grey).make(),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              "64kg".text.make(),
                              "14kg".text.make(),
                              "50kg".text.make()
                            ],
                          )
                        ],
                      ),
                      10.heightBox,
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: LinearProgressIndicator(
                          value: 0.4,
                          minHeight: 10,
                          backgroundColor: Color(0xffE2E2E2),
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      ),
                    ],
                  ).box.margin(EdgeInsets.only(left: 20, right: 40)).make(),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(()=>EnterWeight());
                    },
                    child: Icon(Icons.add, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
              ),
              40.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
