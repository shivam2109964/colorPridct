import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:strive/Services/ColorGameScreen/src/screen/ColorGameScreen.dart';
import 'package:strive/Services/common/src/utils/MediaQuary.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenSize.width(context);
    double screenHeight = ScreenSize.height(context);
    return SafeArea(
      child: Scaffold(
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
                  const Column(
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
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      height: screenHeight * 0.25,
                      width: screenWidth * 0.9,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            45,
                          ),
                        ),
                        gradient: LinearGradient(
                          colors: [Colors.deepPurple, Colors.deepOrange],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          //Inside Card a container for Money Value
                          Container(
                            width: screenWidth * 0.45,
                            height: screenHeight * 0.24,
                            decoration:
                                const BoxDecoration(color: Colors.transparent),
                            child: const Center(
                              child: Text(
                                "₹5000 +",
                                style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.lightGreenAccent),
                              ),
                            ),
                          ),
                          // Inside Card a container for Image
                          Container(
                            width: screenWidth * 0.45,
                            height: screenHeight * 0.24,
                            decoration:
                                const BoxDecoration(color: Colors.transparent),
                            child: Image.asset("assets/images/ruppes.png"),
                          )
                        ],
                      ),
                    ),
                  ),
                  //Second Container for Color Game Prediction
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      height: screenHeight * 0.25,
                      width: screenWidth * 0.9,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            45,
                          ),
                        ),
                        gradient: LinearGradient(
                          colors: [Colors.deepPurple, Colors.deepOrange],
                        ),
                      ),
                      //Modify Seond Card
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              const CircleAvatar(
                                maxRadius: 84,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage(
                                  'assets/images/homeImgTwo.png',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: SizedBox(
                                  height: 50,
                                  width: 140,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        iconColor: MaterialStateProperty.all(
                                            Colors.black)),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ColorGame(),
                                        ),
                                      );
                                    },
                                    child: const Row(
                                      children: [
                                        Icon(Icons.gamepad_outlined),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Text(
                                            "Play",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
