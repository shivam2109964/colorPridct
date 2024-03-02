import 'package:flutter/material.dart';
import 'package:strive/service%20-%201/src/utils/MediaQuary.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenSize.width(context);
    double screenHeight = ScreenSize.height(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: screenHeight * 0.5,
            width: screenWidth * 1,
            decoration: const BoxDecoration(
              color: Colors.white
            ),
          ),
          Container(
            height: screenHeight * 0.5,
            width: screenWidth * 1,
          decoration: const BoxDecoration(
            color: Colors.white
          ),
          ),
        ],
      ),
    );
  }
}
