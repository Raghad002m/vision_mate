import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vision_mate/screens/register.dart';
import'package:vision_mate/screens/loginScreen.dart';
import 'package:vision_mate/splashScreen.dart';
import 'Data/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBSqflite.instance.database;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/register": (context) => register(),
        "/login":(context) => loginScreen(),
        "/splash": (context)=> splashScreen()
      },
      initialRoute: "/splash",
    );
  }
}





