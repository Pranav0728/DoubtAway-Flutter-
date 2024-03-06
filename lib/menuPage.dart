import 'package:doubtaway/HomePage.dart';
import 'package:doubtaway/MainHomePage.dart';
import 'package:doubtaway/NotesPage.dart';
import 'package:doubtaway/Profilepage.dart';
import 'package:doubtaway/SearchPage.dart';
import 'package:doubtaway/UiHelper.dart';
import 'package:doubtaway/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  final UserModel userModel;
  final User firebaseUser;
  const MenuPage(
      {super.key, required this.userModel, required this.firebaseUser});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int myIndex = 0;
  late List<Widget> widgetList;

  @override
  void initState() {
    super.initState();
    widgetList = [
      MainHomePage(),
      HomePage(userModel: widget.userModel, firebaseUser: widget.firebaseUser),
      NotesPage(),
      ProfilePage(
          userModel: widget.userModel, firebaseUser: widget.firebaseUser)
    ];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetList[myIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        onTap: (index) {
          if (index >= 0 && index < widgetList.length) {
            setState(() {
              myIndex = index;
            });
          }
        },
        currentIndex: myIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: myCustomColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "Chats",
              backgroundColor: myCustomColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: "Notes",
              backgroundColor: myCustomColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              backgroundColor: myCustomColor)
        ],
      ),
    );
  }
}
