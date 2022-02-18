import 'package:bmi_app/home_screen.dart';
import 'package:flutter/material.dart';

main() => runApp(const BMI());

class BMI extends StatelessWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.pink,
          canvasColor: Colors.white30,
          textTheme: const TextTheme(
            headline1: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.w800,
            ),
            headline2: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white, size: 90)),
      debugShowCheckedModeBanner: false,
      title: "BMI Calculator",
      home: const HomePage(),
    );
  }
}
