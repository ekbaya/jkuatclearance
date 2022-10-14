import 'package:flutter/material.dart';
import 'package:student_clearance/constants/style.dart';
import 'package:url_strategy/url_strategy.dart';

import 'pages/home.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JKUAT Clearance System',
      theme: buildTheme(Brightness.light),
      home: const HomePage(),
    );
  }
}
