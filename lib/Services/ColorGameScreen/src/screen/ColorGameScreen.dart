import 'package:flutter/material.dart';
import 'package:strive/Services/common/src/utils/MediaQuary.dart';

class ColorGame extends StatelessWidget {
  const ColorGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenSize.height(context);
    double screenWidth = ScreenSize.width(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
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
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        const SimpleDialog(
                                      title: Text("Join Red"),
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(25),
                                          child: Text("Hello Again"),
                                        ),
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
                                        const SimpleDialog(
                                      title: Text("Join Violet"),
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(25),
                                          child: Text("Hello Again"),
                                        ),
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
                                        const SimpleDialog(
                                      title: Text("Join Green"),
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(25),
                                          child: Text("Hello Again"),
                                        ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            child: const Center(
                              child: Text(
                                "00:59",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.yellowAccent),
                              ),
                            ),
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
    );
  }
}
