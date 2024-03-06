import 'package:doubtaway/CompleteProfile.dart';
import 'package:doubtaway/FirstPage.dart';
import 'package:doubtaway/UiHelper.dart';
import 'package:doubtaway/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final UserModel userModel;
  final User firebaseUser;
  const ProfilePage(
      {super.key, required this.userModel, required this.firebaseUser});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return FirstPage();
                }),
              );
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          ),
        ],
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: myCustomColor,
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: widget.userModel.profilepic != null
                            ? Image.network(
                                widget.userModel.profilepic!,
                                width: 100,
                                height: 120,
                                fit: BoxFit.cover,
                              )
                            : Icon(
                                Icons.person,
                                size: 60,
                              ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            widget.userModel.fullname!.toString(),
                            style: TextStyle(
                                fontFamily: "Helvetica2",
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          child: Text(
                            "VU1F2223021",
                            style: TextStyle(
                                fontFamily: "Helvetica2",
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Class: SE",
                              style: TextStyle(
                                  fontFamily: "Helvetica2",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w200),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "DIV: A",
                              style: TextStyle(
                                  fontFamily: "Helvetica2",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w200),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "vu1f2223021@pvppcoe.ac.in",
                          style: TextStyle(
                              fontFamily: "Helvetica2",
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(
              height: 30,
            ),
            Text(
              "More Information",
              style: TextStyle(
                  fontFamily: "Helvetica2",
                  fontSize: 25,
                  color: myCustomColor,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 155,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Department:",
                                style: TextStyle(
                                    fontFamily: "Helvetica2",
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Computer",
                                style: TextStyle(
                                  fontFamily: "Helvetica2",
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 155,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Date of Birth:",
                                style: TextStyle(
                                    fontFamily: "Helvetica2",
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "28-07-2004",
                                style: TextStyle(
                                  fontFamily: "Helvetica2",
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 155,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "G.R NO:",
                                style: TextStyle(
                                    fontFamily: "Helvetica2",
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "9077",
                                style: TextStyle(
                                  fontFamily: "Helvetica2",
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 155,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Blood Group:",
                                style: TextStyle(
                                    fontFamily: "Helvetica2",
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "O+",
                                style: TextStyle(
                                  fontFamily: "Helvetica2",
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 155,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Admission Year:",
                                style: TextStyle(
                                    fontFamily: "Helvetica2",
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "2022-2023",
                                style: TextStyle(
                                  fontFamily: "Helvetica2",
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 155,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Category",
                                style: TextStyle(
                                    fontFamily: "Helvetica2",
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Open",
                                style: TextStyle(
                                  fontFamily: "Helvetica2",
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: myCustomColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CompleteProfile(
                userModel: widget.userModel, firebaseUser: widget.firebaseUser);
          }));
        },
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
  }
}
