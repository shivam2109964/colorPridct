import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:strive/Services/ColorGameScreen/src/screen/ColorGameScreen.dart';
import 'package:strive/Services/common/src/utils/MediaQuary.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  //For Balance update
  double balance = 20;

  TextEditingController amountController = TextEditingController();

  void deposit(double amount) {
    setState(() {
      balance += amount;
    });
  }

  void withdra(double amount) {
    setState(() {
      if (balance >= amount) {
        balance -= amount;
      } else {
        _showInsufficientAmountDialog();
      }
    });
  }

  //Balance Dialog Box
  void _showInsufficientAmountDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Insufficient Balance"),
          content: const Text("You do not have enough balance."),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Ok"))
          ],
        );
      },
    );
  }

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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //For Balance and Card Info
                          Container(
                            height: screenHeight * 0.24,
                            width: screenWidth * 0.49,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45)),
                                color: Colors.transparent),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  "Earning",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 90,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Color.fromARGB(179, 35, 0, 45)),
                                  child: const Text(
                                    "₹5000+",
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.green),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      const Text(
                                        "Balance",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 40,
                                        width: 90,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color:
                                                Color.fromARGB(179, 35, 0, 45)),
                                        child: Text(
                                          "₹$balance",
                                          style: const TextStyle(
                                              fontSize: 25,
                                              color: Colors.yellow),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //For Image
                          Container(
                            height: screenHeight * 0.24,
                            width: screenWidth * 0.4,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45)),
                                color: Colors.transparent),
                            child: const CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage(
                                'assets/images/ruppes.png',
                              ),
                            ),
                          ),
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
                              const SizedBox(
                                height: 200,
                                width: 200,
                                child: CircleAvatar(
                                  maxRadius: 84,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage(
                                    'assets/images/icon.png',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
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
