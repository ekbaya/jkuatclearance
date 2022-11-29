import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

mixin AppConfig {
  //firebase
  static DatabaseReference usersReference =
      FirebaseDatabase.instance.ref("users");
  static FirebaseFirestore firebaseFiretore = FirebaseFirestore.instance;
  static FirebaseAuth auth = FirebaseAuth.instance;
}
