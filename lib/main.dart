import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_clearance/constants/style.dart';
import 'package:student_clearance/pages/welcome.dart';
import 'package:student_clearance/providers/application.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setPathUrlStrategy();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Application()),
      ],
      child: const MyApp(),
    ),
  );
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
      home: const WelcomePage(),
    );
  }
}
