import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: <Widget>[
              Positioned(
                top: 300,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: const BoxDecoration(color: Colors.deepPurple),
                ),
              ),
              Positioned(
                top: 300,
                right: 0,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: const BoxDecoration(color: Colors.deepPurple),
                ),
              ),
              Positioned(
                top: 90,
                right: 80,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: const BoxDecoration(color: Colors.deepOrange),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              )
            ],
          ),
        ));
  }
}
