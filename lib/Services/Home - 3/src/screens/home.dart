import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:strive/Services/common/src/utils/MediaQuary.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenSize.width(context);
    double screenHeight = ScreenSize.height(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(
          10,
        ),
        child: Center(
          child: Container(
            height: screenHeight * 0.9,
            width: screenWidth * 0.9,
            decoration: const BoxDecoration(color: Colors.black),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //Column for User name and Greeting
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    //Creating a row for Name print
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Hello ",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Text(
                          "Shivam",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                    //Now its time for Greet
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Welcome Back!",
                          style: TextStyle(fontSize: 45, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                //Move Forword after creating name and greeting
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Container(
                      height: screenHeight * 0.25,
                      width: screenWidth * 0.9,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        gradient: LinearGradient(
                          colors: [Colors.deepPurple, Colors.deepOrange],
                        ),
                      ),
                      child: null),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
