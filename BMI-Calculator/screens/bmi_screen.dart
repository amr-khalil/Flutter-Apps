import 'dart:math';

import 'package:bmi_app/screens/result_screen.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;
  double height = 120;
  int age = 30;
  int weight = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: <Widget>[
          // Gender
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 70,
                            ),
                            SizedBox(height: 15),
                            Text(
                              "MALE",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: isMale ? Colors.blue : Colors.grey[400],
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 70,
                            ),
                            SizedBox(height: 15),
                            Text(
                              "FEMALE",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: isMale ? Colors.grey[400] : Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Height
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "${height.round()}",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "CM",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                        value: height,
                        min: 80,
                        max: 220,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        })
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "$age",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age -= 1;
                                  });
                                },
                                child: Icon(Icons.remove),
                                mini: true,
                                heroTag: "age-",
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age += 1;
                                  });
                                },
                                child: Icon(Icons.add),
                                mini: true,
                                heroTag: "age+",
                              )
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "$weight",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight -= 1;
                                  });
                                },
                                child: Icon(Icons.remove),
                                mini: true,
                                heroTag: "weight-",
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight += 1;
                                  });
                                },
                                child: Icon(Icons.add),
                                mini: true,
                                heroTag: "weight+",
                              )
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(
              onPressed: () {
                var result = weight / pow(height / 100, 2);
                var classification = "";

                if (result < 17.5) {
                  classification = "Underweight";
                } else if (result >= 17.5 && result < 24) {
                  classification = "Normal Weight";
                } else if (result >= 24 && result < 29) {
                  classification = "Overweight";
                } else if (result >= 29 && result < 30) {
                  classification = "Serve Overweight";
                } else {
                  classification = "Obesity";
                }

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(
                            result: result,
                            isMale: isMale,
                            age: age,
                            classification: classification)));
              },
              child: Text(
                "CALCULATE",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              height: 50.0,
            ),
          )
        ],
      ),
    );
  }
}
