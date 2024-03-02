import 'package:flutter/material.dart';

class ColorGame extends StatelessWidget {
  const ColorGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Start Game",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
