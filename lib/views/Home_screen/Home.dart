import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/consts/consts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<SharedPreferences> _prefs;

  @override
  void initState() {
    super.initState();
    _prefs = SharedPreferences.getInstance();
  }

  void updateStreak(SharedPreferences prefs) {
    if (prefs.containsKey('lastDate')) {
      DateTime? lastDate = DateTime.tryParse(prefs.getString('lastDate') ?? '');

      DateTime currentDate = DateTime.now();
      int streak = prefs.getInt('streak') ?? 0;

      if (lastDate != null) {
        // Check if the last date is yesterday
        if (lastDate.year == currentDate.year &&
            lastDate.month == currentDate.month &&
            lastDate.day == currentDate.day - 1) {
          streak++; // Increment streak if opened consecutively
        } else {
          streak = 0; // Reset streak if missed a day
        }
      }

      prefs.setInt('streak', streak);
      prefs.setString('lastDate', currentDate.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      body: FutureBuilder<SharedPreferences>(
        future: _prefs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            SharedPreferences prefs = snapshot.data!;
            updateStreak(prefs); // Update streak after prefs are initialized

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: skyColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        (context.screenHeight * 0.02).heightBox,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: "Home".text
                                .color(Colors.white)
                                .fontFamily(semibold)
                                .size(22)
                                .make(),
                          ),
                        ),
                        Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(homeCalenderBackground),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Streak: ${prefs.getInt('streak') ?? 0}",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: whiteColor,
                                  ),
                                ),
                                Spacer(),
                                Image.asset(calender),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  15.heightBox,
                  Column(
                    children: [
                      20.heightBox,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Calories".text.size(18).fontFamily(bold).make(),
                            Image.asset(icAdd),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child:
                          "Calories Budget".text.fontFamily(semibold).make(),
                        ),
                      ),
                      25.heightBox,
                      Stack(
                        children: [
                          Image.asset(icHeart),
                          Positioned(
                            top: 20,
                            left: 45,
                            child: Column(
                              children: [
                                5.heightBox,
                                "1320".text.color(Colors.blue).fontFamily(bold).make(),
                                "Left".text.color(Colors.grey).make(),
                                "40".text.color(Colors.grey).fontFamily(bold).make(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ).box.white.width(context.screenWidth - 30).height(250).shadowSm.rounded.make(),
                  15.heightBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.heightBox,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: "Journal".text.fontFamily(bold).size(18).make(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: "Write how you feel".text.color(Colors.grey).fontFamily(semibold).make(),
                      ),
                    ],
                  ).box.white.width(context.screenWidth - 30).shadowSm.height(Get.height * .2).rounded.make(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
