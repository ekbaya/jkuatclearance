import 'package:flutter/material.dart';

import '../pages/home.dart';

class LoginComponent extends StatelessWidget {
  final Function createAccount;
  const LoginComponent({Key? key, required this.createAccount})
      : super(key: key);

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
              obscureText: true,
              onChanged: (value) {},
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
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
                  onTap: () {},
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(width: 1.0, color: Colors.grey),
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
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
                createAccount.call();
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
