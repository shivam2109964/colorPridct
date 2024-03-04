import 'package:flutter/material.dart';
import 'package:strive/Dummy.dart';
import 'package:strive/Services/SignIN%20-%202/src/screen/SignIn.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
