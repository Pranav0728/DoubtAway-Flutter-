import 'package:doubtaway/LoginPage.dart';
import 'package:doubtaway/Teacher/LoginTpage.dart';
import 'package:doubtaway/UiHelper.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Image.asset(
                "assets/images/1.png",
                height: 300,
                width: 300,
              )),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Choose Your Proffesion",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Helvetica"),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/student.png",
                          height: 150,
                        ),
                        const Text(
                          "Student",
                          style: TextStyle(
                              fontFamily: "Helvetica",
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginTPage()));
                    },
                    child: Container(
                        child: Column(
                      children: [
                        Image.asset(
                          "assets/images/teacher.png",
                          height: 150,
                        ),
                        const Text(
                          "Teacher",
                          style: TextStyle(
                              fontFamily: "Helvetica",
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
      bottomNavigationBar: Container(
          height: 50,
          width: 100,
          child: Center(
              child: Text(
            "Powered By Xroot",
            style: TextStyle(
                fontFamily: "Helvetica2",
                fontWeight: FontWeight.w500,
                color: myCustomColor),
          ))),
    );
  }
}
