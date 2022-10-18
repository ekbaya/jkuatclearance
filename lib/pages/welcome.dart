import 'package:flutter/material.dart';
import 'package:student_clearance/components/LoginComponent.dart';
import 'package:student_clearance/components/RegistrationComponent.dart';

import 'home.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool loginModule = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.teal,
                image: DecorationImage(
                  image: AssetImage("assets/students.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height,
                    decoration:
                        BoxDecoration(color: Colors.teal.withOpacity(0.5)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/jkuat-logo.png",
                        width: 120,
                        height: 120,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 100),
                        child: Text(
                          "JKUAT Students Online Clearance System is a platform that allow students to clear with various offices online. Do your clearance anytime and anywhere.",
                          style: TextStyle(fontSize: 20, color: Colors.white60),
                        ),
                      ),
                      const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Container(
              color: Colors.white,
              child: loginModule
                  ? LoginComponent(createAccount: () {
                      setState(() {
                        loginModule = false;
                      });
                    })
                  : RegistrationComponent(
                      login: () {
                        setState(() {
                          loginModule = true;
                        });
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
