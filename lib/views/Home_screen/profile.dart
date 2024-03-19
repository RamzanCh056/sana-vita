// Import necessary packages and files
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/consts/consts.dart';
import 'package:untitled/views/EditProfile/inviteFriends.dart';
import '../../consts/list.dart'; // Importing list constants
import '../../model/user_model.dart';
import '../EditProfile/editprofileScreen.dart';
import '../EditProfile/languages.dart';
import '../EditProfile/weightTracker.dart';
import '../auth_screen/loginScreen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
// Define a Profile StatefulWidget
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

// Define the state for Profile widget
class _ProfileState extends State<Profile> {
  bool isDarkMode = false;
  bool isLoading = false;


  Future<void> getUser() async {
    try {
      // Clear the user list and update the UI
      user.clear();
      setState(() {
        isLoading = true;
      });

      // Open the SQLite database
      Database database = await openDatabase(
        join(await getDatabasesPath(), 'your_database.db'),
        version: 1,
      );

      // Query the database to retrieve the user profile
      List<Map<String, dynamic>> userRows = await database.query(
        'users',
        where: 'doc = ?',
        whereArgs: [StaticInfo.docId.toString()],
      );
   // print("user ${userRows[0]}");
      // Process the retrieved user data
      for (int i = 0; i < userRows.length; i++) {
        AddUserModel dataModel = AddUserModel.fromJson(userRows[i]);
        user.add(dataModel);
      }

      // Close the database
      await database.close();

      // Update the loading state and UI
      setState(() {
        isLoading = false;
      });

      // Print the name of the user
      if (user.isNotEmpty) {
        print('Name: ${user[0].name}');
      }
    } catch (e) {
      // Handle any errors
      print(e.toString());
      setState(() {
        isLoading = false;
      });
    }
  }



  // getUser() {
  //   try {
  //     user.clear();
  //     setState(() {});
  //     FirebaseFirestore.instance.collection("users").where('doc', isEqualTo: StaticInfo.docId.toString()).snapshots().listen((event) {
  //       user.clear();
  //       setState(() {});
  //       for (int i = 0; i < event.docs.length; i++) {
  //         AddUserModel dataModel = AddUserModel.fromJson(event.docs[i].data());
  //         user.add(dataModel);
  //       }
  //       setState(() {
  //         isLoading = false;
  //       });
  //     });
  //     setState(() {
  //       isLoading = false;
  //     });
  //   } catch (e) {}
  // }
  List<AddUserModel> user = [];
  @override
  void initState() {
    super.initState();
    getUser();
    // Show the popup when the profile screen is opened
    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    //   _showPopup();
    // });
  }

  // Function to show the popup
  // Future<void> _showPopup() async {
  //   await showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         contentPadding: EdgeInsets.zero,
  //         content: Container(
  //           width: Get.width * 1,
  //           height: Get.height * 0.35,
  //
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(10),
  //             color: Colors.white,
  //           ),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               10.heightBox, // Widget to add vertical space
  //               Container(
  //                 width: Get.width * 0.15,
  //                 height: Get.height * 0.12,
  //                 decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   color: Colors.lightBlueAccent.withOpacity(0.1),
  //                 ),
  //                 child: Icon(
  //                   Icons.share,
  //                   color: Colors.blue,
  //                   size: 40,
  //                 ),
  //               ),
  //               const Text('Share Referral Link', style: TextStyle(fontFamily: bold, fontSize: 17)), // Widget to display text
  //               20.heightBox, // Widget to add vertical space
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: [
  //                   Image.asset(icWhatsapp,width: 40,), // Widget to display image
  //                   Image.asset(icFb,width: 40,), // Widget to display image
  //                   Image.asset(icMessage,width: 40,), // Widget to display image
  //                   Image.asset(icMessenger,width: 40,) // Widget to display image
  //                 ],
  //               ),
  //               30.heightBox, // Widget to add vertical space
  //               ElevatedButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 style: ButtonStyle(
  //                   backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
  //                 ),
  //                 child: "OK".text.white.make(), // Widget to display button
  //               ).box.width(120).height(45).make() // Styling the button
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading?Center(child: CircularProgressIndicator()):
        Container(
          child: Column(
            children: [
              const SizedBox(height: 20), // Widget to add vertical space
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Get.offAll(() => LoginScreen()); // Navigate to LoginScreen
                  },
                  child: const Text("Logout", style: TextStyle(color: Colors.red, fontSize: 17)), // Widget to display text button
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    icProfile,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 15), // Widget to add horizontal space
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.isNotEmpty ? user[0].name.toString() : "",
                          style: TextStyle(fontFamily: semibold, color: darkFontGrey, fontSize: 18), // Styling the text
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40), // Widget to add vertical space
              // Button section
              ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return Divider(color: Colors.grey); // Widget to display divider
                },
                itemCount: accountProfileButtonList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      if (index == 0) {
                        Get.to(() => EditProfileScreen(userData:  user[0])); // Replace `AddUserModel.default()` with the appropriate way to create a default `AddUserModel` instance

                      } else if (index == 1) {
                      //  _showPopup();
                        // showModalBottomSheet(
                        //   isScrollControlled: true,
                        //   context: context,
                        //   builder: (context) {
                        //     return InviteFriend(); // Show modal bottom sheet for inviting friends
                        //   },
                        // );
                      } else if (index == 2) {
                        Get.to(() => WeightTracker()); // Navigate to WeightTracker
                      } else if (index == 3) {
                        Get.to(() => LanguagesScreen()); // Navigate to LanguagesScreen
                      }
                    },
                    contentPadding: EdgeInsets.zero,
                    title: accountProfileButtonList[index].text.make(), // Widget to display button text
                    trailing: Image.asset(accountProfileIconList[index]), // Widget to display button icon
                  );
                },
              ).box.rounded.padding(EdgeInsets.symmetric(horizontal: 16)).make(), // Styling the ListView
              Divider(color: Colors.grey), // Widget to display divider
              ListTile(
                title: const Text("Dark Mode"), // Widget to display text
                trailing: Switch(
                  value: isDarkMode, // Current value of dark mode switch
                  onChanged: (bool value) {
                    setState(() {
                      isDarkMode = !isDarkMode; // Toggle the dark mode
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
