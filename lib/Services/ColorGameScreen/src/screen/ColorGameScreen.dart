import 'package:flutter/material.dart';
import 'package:strive/Services/ColorGameScreen/src/models/colorBackend.dart';
import 'package:strive/Services/common/src/utils/MediaQuary.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class ColorGame extends StatefulWidget {
  const ColorGame({super.key});
  @override
  State<ColorGame> createState() => _ColorGameState();
}

class _ColorGameState extends State<ColorGame> {
  ColorPridect colorPridect = ColorPridect();
//This is for timer
  int group1Tokens = 0;
  int gorup2Tokesn = 0;
  bool isTimeRunning = false;
  int _start = 60;
  late Timer? _timer;
  int get start => _start;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      int startTime =
          prefs.getInt('startTime') ?? DateTime.now().millisecondsSinceEpoch;
      int currentTime = DateTime.now().millisecondsSinceEpoch;
      int elapsedTime = currentTime - startTime;
      int remainingTime = 60 - (elapsedTime ~/ 1000) % 60;
      setState(() {
        _start = remainingTime;
      });
      startTimer();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int startTime =
        prefs.getInt('startTime') ?? DateTime.now().millisecondsSinceEpoch;
    prefs.setInt('startTime', startTime);
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    int elapsedTime = currentTime - startTime;
    int remainingTime = 60 - (elapsedTime ~/ 1000) % 60;
    _start = remainingTime;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          isTimeRunning = true;
          _start = 59;
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }
  //That's it

  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenSize.height(context);
    double screenWidth = ScreenSize.width(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            //Container Starts form Here
            child: Container(
              height: screenHeight * 0.9,
              width: screenWidth * 1,
              decoration: const BoxDecoration(color: Colors.black),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //Contianer for Color Options
                  Container(
                    height: screenHeight * 0.27,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white,
                    ),
                    //Inside  Container have a columne
                    child: Column(
                      children: <Widget>[
                        //Inside Column have a 3 Row
                        //First Row for Text
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.emoji_events_outlined),
                                  Text(
                                    " Parity",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          indent: BorderSide.strokeAlignCenter,
                          color: Colors.black,
                        ),
                        //Second Row for Color Container
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            //Red Container
                            Container(
                              height: 100,
                              width: 100,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      30,
                                    ),
                                  ),
                                  color: Colors.red),
                              child: const Center(
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage(
                                    'assets/images/rocket.png',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 100,
                              width: 100,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      30,
                                    ),
                                  ),
                                  color: Colors.deepPurple),
                              child: const Center(
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage(
                                    'assets/images/rocket.png',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 100,
                              width: 100,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      30,
                                    ),
                                  ),
                                  color: Colors.green),
                              child: const Center(
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage(
                                    'assets/images/rocket.png',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //Third Row button Taking action
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SizedBox(
                                width: 100,
                                child: ElevatedButton(
                                  //dialog box edit
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          SimpleDialog(
                                        title: const Center(
                                            child: Text(
                                          "Join Red",
                                          style: TextStyle(fontSize: 25),
                                        )),
                                        children: <Widget>[
                                          const Divider(
                                            color: Colors.red,
                                          ),
                                          Container(
                                            width: screenWidth * 0.7,
                                            height: screenHeight * 0.18,
                                            decoration: const BoxDecoration(
                                                color: Colors.transparent),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: <Widget>[
                                                    Text(
                                                      "Enter Lot",
                                                      style: TextStyle(
                                                          fontSize: 22),
                                                    ),
                                                    SizedBox(
                                                      width: 40,
                                                      height: 40,
                                                      child: TextField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        style: TextStyle(
                                                            fontSize: 22),
                                                        //Calculate Dialog Box Total Amount
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.all(15),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "1 Lot = ₹10",
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                  width: 100,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    child: const Text(
                                                      "Buy",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Red",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          SimpleDialog(
                                        title: const Center(
                                            child: Text(
                                          "Join Violet",
                                          style: TextStyle(fontSize: 25),
                                        )),
                                        children: <Widget>[
                                          const Divider(
                                            color: Colors.deepPurple,
                                          ),
                                          Container(
                                            width: screenWidth * 0.7,
                                            height: screenHeight * 0.18,
                                            decoration: const BoxDecoration(
                                                color: Colors.transparent),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: <Widget>[
                                                    Text(
                                                      "Enter Lot",
                                                      style: TextStyle(
                                                          fontSize: 22),
                                                    ),
                                                    SizedBox(
                                                      width: 40,
                                                      height: 40,
                                                      child: TextField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        style: TextStyle(
                                                            fontSize: 22),
                                                        //Calculate Dialog Box Total Amount
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.all(15),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "1 Lot = ₹10",
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                  width: 100,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    child: const Text(
                                                      "Buy",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Violet",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          SimpleDialog(
                                        title: const Center(
                                            child: Text(
                                          "Join Green",
                                          style: TextStyle(fontSize: 25),
                                        )),
                                        children: <Widget>[
                                          const Divider(
                                            color: Colors.green,
                                          ),
                                          Container(
                                            width: screenWidth * 0.7,
                                            height: screenHeight * 0.18,
                                            decoration: const BoxDecoration(
                                                color: Colors.transparent),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: <Widget>[
                                                    Text(
                                                      "Enter Lot",
                                                      style: TextStyle(
                                                          fontSize: 22),
                                                    ),
                                                    SizedBox(
                                                      width: 40,
                                                      height: 40,
                                                      child: TextField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        style: TextStyle(
                                                            fontSize: 22),
                                                        //Calculate Dialog Box Total Amount
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.all(15),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "1 Lot = ₹10",
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                  width: 100,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    child: const Text(
                                                      "Buy",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Green",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Now Create a second Container for result
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      height: screenHeight * 0.6,
                      width: screenHeight * 1,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            30,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      //Inside container more widgets
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(
                              10,
                            ),
                            // Result Bar
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    30,
                                  ),
                                ),
                                color: Colors.blue.shade100,
                              ),
                              //Colors Dot for the showing end result
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.red,
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.green,
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //Timer Container
                          Padding(
                            padding: const EdgeInsets.all(
                              5,
                            ),
                            child: Container(
                              height: 50,
                              width: 120,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    30,
                                  ),
                                ),
                                color: Color.fromARGB(134, 20, 19, 19),
                              ),
                              child: Center(
                                child: Text(
                                  '00:$start',
                                  style: const TextStyle(
                                      fontSize: 30, color: Colors.yellowAccent),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(
                              10,
                            ),
                            child: Container(
                              height: screenHeight * 0.2,
                              width: screenWidth * 1,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      30,
                                    ),
                                  ),
                                  color: Colors.amber),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
