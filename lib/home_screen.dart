import 'dart:math';

import 'package:flutter/material.dart';

import 'result_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool gender = true;
  double heightValue = 170.0;
  int weight = 55;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI calculator"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      buildExpanded(context, "Male", Icons.male),
                      const SizedBox(width: 10),
                      buildExpanded(context, "Female", Icons.female),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(height: 20),
                        Text("Height",
                            style: Theme.of(context).textTheme.headline2),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              heightValue.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "CM",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellowAccent),
                            ),
                          ],
                        ),
                        Slider(
                          activeColor: Colors.greenAccent,
                          inactiveColor: Colors.amber,
                          min: 90,
                          max: 220,
                          value: heightValue,
                          onChanged: (newValue) =>
                              setState(() => heightValue = newValue),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      build2Expanded(context, "Weight"),
                      const SizedBox(width: 10),
                      build2Expanded(context, "Age"),
                    ],
                  ),
                ),
              ),
              TextButton(
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 15,
                  width: double.infinity,
                  color: Colors.red,
                  child: Text(
                    "Calculate",
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                  ),
                ),
                onPressed: () {
                  var result = weight / pow(heightValue / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Result(result: result, isMale: gender, age: age),
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }

  Expanded buildExpanded(BuildContext context, String type, IconData icon) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (type == "Male") {
              gender = true;
            } else {
              gender = false;
            }
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (gender == true && type == "Male") |
                    (gender == false && type == "Female")
                ? Colors.red
                : Colors.teal,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
              ),
              const SizedBox(height: 8),
              Text(
                type,
                style: Theme.of(context).textTheme.headline2,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded build2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.red),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(type == "Age" ? "Age" : "Weight",
                style: Theme.of(context).textTheme.headline2),
            const SizedBox(height: 8),
            Text(type == "Age" ? "$age" : "$weight",
                style: Theme.of(context).textTheme.headline1),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == "Age" ? "Age--" : "Weight--",
                  onPressed: () =>
                      setState(() => type == "Age" ? age-- : weight--),
                  child: const Icon(
                    Icons.remove,
                    size: 25,
                  ),
                  mini: true,
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  heroTag: type == "Age" ? "Age++" : "Weight++",
                  onPressed: () =>
                      setState(() => type == "Age" ? age++ : weight++),
                  child: const Icon(
                    Icons.add,
                    size: 25,
                  ),
                  mini: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
