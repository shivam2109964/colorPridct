import 'package:flutter/material.dart';
import 'package:strive/service%20-%201/src/screen/SignIn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build (BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn() ,
    );
  }
}