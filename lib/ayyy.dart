import 'dart:async';
import 'package:flutter/material.dart';

class TokenSubmissionPage extends StatefulWidget {
  @override
  _TokenSubmissionPageState createState() => _TokenSubmissionPageState();
}

class _TokenSubmissionPageState extends State<TokenSubmissionPage> {
  int group1Tokens = 0;
  int group2Tokens = 0;
  bool isTimerRunning = false;
  int _start = 60;
  Timer? _timer;

  void startTimer() {
    const oneSecond = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (Timer timer) {
      if (_start == 0) {
        setState(() {
          isTimerRunning = true;
        });
       _start = 60;
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void reset() {
    setState(() {
      group1Tokens = 0;
      group2Tokens = 0;
      isTimerRunning = false;
      _start = 60;
      _timer?.cancel(); // Cancel the timer when reset is pressed
    });
  }

  void submitTokenToGroup1() {
    if (_start > 10) {
      setState(() {
        group1Tokens++;
      });
    }
  }

  void submitTokenToGroup2() {
    if (_start > 10) {
      setState(() {
        group2Tokens++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Token Submission'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_start',
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  color: isTimerRunning && group1Tokens < group2Tokens
                      ? Colors.green
                      : Colors.grey,
                  child: Center(
                    child: Text(
                      'Group 1: $group1Tokens',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: isTimerRunning && group2Tokens < group1Tokens
                      ? Colors.green
                      : Colors.grey,
                  child: Center(
                    child: Text(
                      'Group 2: $group2Tokens',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                submitTokenToGroup1();
              },
              child: Text('Submit Token to Group 1'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                submitTokenToGroup2();
              },
              child: Text('Submit Token to Group 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                startTimer();
              },
              child: Text('Start Timer'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                reset();
              },
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
