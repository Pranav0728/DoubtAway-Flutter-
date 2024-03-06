// ignore_for_file: use_build_context_synchronously

import 'package:doubtaway/CompleteProfile.dart';
import 'package:doubtaway/HomePage.dart';
import 'package:doubtaway/LoginPage.dart';
import 'package:doubtaway/UiHelper.dart';
import 'package:doubtaway/models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final codeController = TextEditingController();
  final teacherCodeController = TextEditingController();

  signUp(String email, String password) async {
    UIHelper.showLoadingDialog(context, "Creating new account...");
    UserCredential? credential;
    if (email.isEmpty || password.isEmpty) {
      Navigator.pop(context);
      showCustomAlert(context, "Enter Required Fields", Colors.red);
    } else {
      try {
        credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        if (credential != null) {
          String uid = credential.user!.uid;
          UserModel newuser = UserModel(
            uid: uid,
            email: email,
            fullname: "",
            profilepic: "",
          );

          await FirebaseFirestore.instance
              .collection("users")
              .doc(uid)
              .set(newuser.toMap());

          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) {
              return CompleteProfile(
                  userModel: newuser, firebaseUser: credential!.user!);
            }),
          );
        } else {
          Navigator.pop(context);
          showCustomAlert(context, "Error", Colors.red);
        }
      } on FirebaseAuthException catch (ex) {
        Navigator.pop(context);
        showCustomAlert(context, ex.message ?? "An error occurred", Colors.red);
      } catch (e) {
        Navigator.pop(context);
        showCustomAlert(context, e.toString(), Colors.red);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40),
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
                "SignUp Page",
                style: TextStyle(
                    fontFamily: "Helvetica2",
                    fontSize: 20,
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
              Container(
                height: 44,
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.school,
                        color: myCustomColor,
                      ),
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                      hintText: "Enter College Code",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    controller: codeController,
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
                      signUp(
                        emailController.text.toString().trim(),
                        passwordController.text.toString().trim(),
                      );
                    },
                    child: const Text(
                      "Sign Up",
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
            "Already Have Account?",
            style: TextStyle(fontSize: 16, fontFamily: "Helvetica2"),
          ),
          CupertinoButton(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 1),
              child: Text(
                "Log In",
                style: TextStyle(
                    fontSize: 16,
                    color: myCustomColor,
                    fontFamily: "Halvetica"),
              ),
              onPressed: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              })
        ],
      ),
    );
  }
}
