import 'package:flutter/material.dart';
import 'package:student_clearance/controllers/authcontroller.dart';

import '../pages/home.dart';

class LoginComponent extends StatefulWidget {
  final Function createAccount;
  const LoginComponent({Key? key, required this.createAccount})
      : super(key: key);

  @override
  State<LoginComponent> createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {
  bool obscureText = true;
  bool rememberMe = false;
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4 * 0.8,
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome to JKUAT Online Clearance",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Please sign-in to your account and start the adventure",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Email",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailTextEditingController,
              onChanged: (value) {},
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Password",
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                    onPressed: () {}, child: const Text("Forgot Password?"))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordTextEditingController,
              obscureText: obscureText,
              onChanged: (value) {},
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText ? obscureText = false : obscureText = true;
                    });
                  },
                  icon: const Icon(Icons.remove_red_eye),
                ),
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      rememberMe ? rememberMe = false : rememberMe = true;
                    });
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: rememberMe ? Colors.teal : Colors.white,
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                          width: 1.0,
                          color: rememberMe ? Colors.teal : Colors.grey),
                    ),
                    child: Center(
                      child: rememberMe
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 10,
                            )
                          : const SizedBox(),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Remember Me",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                await AuthController.loginUser(
                    context,
                    emailTextEditingController.text.trim(),
                    passwordTextEditingController.text.trim());
              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                widget.createAccount.call();
              },
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'New on JKUAT Clearance? ',
                        style: TextStyle(color: Colors.black, fontSize: 30)),
                    TextSpan(
                      text: 'Create an account',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
                textScaleFactor: 0.5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
