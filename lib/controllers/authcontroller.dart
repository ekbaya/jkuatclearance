import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:student_clearance/models/account.dart';
import 'package:student_clearance/services/users.dart';
import 'package:student_clearance/utils/appconfig.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';

import '../pages/home.dart';
import '../utils/loader.dart';
import '../utils/toastDialog.dart';

class AuthController {
  static registerNewUser(
      BuildContext context, Account account, String password) async {
    try {
      // Loader().showCustomDialog(context, "Registering");
      UserCredential userCredential = await AppConfig.auth
          .createUserWithEmailAndPassword(
              email: account.email, password: password);

      //redefining User object and assign User ID from the Auth
      Account user = Account(
        id: userCredential.user!.uid,
        firstName: account.firstName,
        email: account.email,
        phone: account.phone,
        lastName: account.lastName,
        institute: account.institute,
        department: account.department,
        role: account.role,
        registrationNo: account.registrationNo,
        yearAndLevel: account.yearAndLevel,
      );
      // saving user data to database
      UsersServices usersServices = UsersServices();
      usersServices.registerUser(user);

      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const HomePage(),
        ),
        (route) => false, //if you want to disable back feature set to false
      );
    } catch (e) {
      ToastDialogue().showToast("Error: $e", 1);
    }
  }

  static loginUser(BuildContext context, String email, String password) async {
    try {
      // Loader().showCustomDialog(context, "Signing in...");
      final UserCredential userCredential = (await AppConfig.auth
          .signInWithEmailAndPassword(email: email, password: password));

      if (kDebugMode) {
        print(userCredential.user!.email);
      }
      // ignore: use_build_context_synchronously
      ToastDialogue().showToast("Success", 0);
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const HomePage(),
        ),
        (route) => false, //if you want to disable back feature set to false
      );
    } catch (e) {
      ToastDialogue().showToast("Error: $e", 1);
    }
  }

  static Future<Account> getAccount(String uid) async {
    UsersServices usersServices = UsersServices();
    return usersServices.getUserById(uid);
  }
}
