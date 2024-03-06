// ignore_for_file: use_build_context_synchronously
import 'package:doubtaway/CompleteProfile.dart';
import 'package:doubtaway/HomePage.dart';
import 'package:doubtaway/SigupPage.dart';
import 'package:doubtaway/UiHelper.dart';
import 'package:doubtaway/menuPage.dart';
import 'package:doubtaway/models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final codeController = TextEditingController();

  Login(String email, String password) async {
    UIHelper.showLoadingDialog(context, "Logging In...");
    if (email == "" || password == "") {
      Navigator.pop(context);
      showCustomAlert(context, "Enter Required fields", Colors.red);
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        if (userCredential != null) {
          String uid = userCredential.user!.uid;
          DocumentSnapshot userData = await FirebaseFirestore.instance
              .collection('users')
              .doc(uid)
              .get();
          UserModel userModel =
              UserModel.fromMap(userData.data() as Map<String, dynamic>);

          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MenuPage(
                    userModel: userModel, firebaseUser: userCredential!.user!)),
          );
        } else {
          Navigator.pop(context);
          showCustomAlert(context, "Unsuccessful", Colors.red);
        }
      } on FirebaseAuthException catch (ex) {
        Navigator.pop(context);
        showCustomAlert(context, ex.code.toString(), Colors.red);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/2.png",
                height: 200,
                width: 200,
              ),
              Image.asset(
                "assets/images/4.png",
                // height: 200,
                width: 200,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Login Page",
                style: TextStyle(
                    fontFamily: "Helvetica2",
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: myCustomColor),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 44,
                child: Center(
                  child: TextField(
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: myCustomColor,
                      ),
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                      hintText: "Enter email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    controller: emailController,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 44,
                child: Center(
                  child: TextField(
                    obscureText: true,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: myCustomColor,
                      ),
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                      hintText: "Enter Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    controller: passwordController,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 30,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CupertinoButton(
                    padding: EdgeInsets.symmetric(vertical: 1, horizontal: 30),
                    color: myCustomColor,
                    onPressed: () {
                      Login(emailController.text.toString().trim(),
                          passwordController.text.toString().trim());
                    },
                    child: const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Don't Have an Account? ",
            style: TextStyle(fontSize: 16, fontFamily: "Helvetica2"),
          ),
          CupertinoButton(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 1),
              child: Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: 16,
                    color: myCustomColor,
                    fontFamily: "Halvetica"),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupPage()));
              })
        ],
      ),
    );
  }
}
