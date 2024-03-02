import 'package:flutter/material.dart';
import 'package:strive/Services/common/src/Commwidget/BottomNaivation.dart';


class BottomMenu extends StatelessWidget{
 const BottomMenu ({Key? key}) : super(key: key);

@override
Widget build(BuildContext context){
    return const SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavi(),
      ),
    );
  }
}