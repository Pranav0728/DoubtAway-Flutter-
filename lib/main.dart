import 'package:doubtaway/FirstPage.dart';
import 'package:doubtaway/HomePage.dart';
import 'package:doubtaway/LoginPage.dart';
import 'package:doubtaway/menuPage.dart';
import 'package:doubtaway/models/FirebaseHelper.dart';
import 'package:doubtaway/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User? currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    UserModel? thisUserModel =
        await FirebaseHelper.getUserModelById(currentUser.uid);
    if (thisUserModel != null) {
      runApp(myAppLogedin(userModel: thisUserModel, firebaseUser: currentUser));
    } else {
      runApp(const myApp());
    }
  } else {
    runApp(const myApp());
  }
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      title: "DoubtAway",
      home: const FirstPage(),
    );
  }
}

class myAppLogedin extends StatelessWidget {
  final UserModel userModel;
  final User firebaseUser;
  const myAppLogedin(
      {super.key, required this.userModel, required this.firebaseUser});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      debugShowCheckedModeBanner: false,
      title: "DoubtAway",
      home: MenuPage(userModel: userModel, firebaseUser: firebaseUser),
    );
  }
}
