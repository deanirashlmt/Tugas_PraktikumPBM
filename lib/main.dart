import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/home_page.dart';
import 'package:flutter_application_1/page/login_page.dart';
import 'package:flutter_application_1/page/register_page.dart';
import 'package:flutter_application_1/page/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/register": (context) => SignUpScreen(),
        "/login": (context) => LoginScreen(),
        "/home": (context) => HomeScreen(),
        "/menu": (context) => BMICalculator(),
      },
      initialRoute: "/home",
    );
  }
}
