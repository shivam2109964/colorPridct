import 'package:flutter/material.dart';

class BottomNavi extends StatefulWidget {
  const BottomNavi({super.key});
  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
   int _selectedIndex = 0;
   void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
   } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(45),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue.shade500,
          unselectedIconTheme: const IconThemeData(color: Colors.black),
          iconSize: 35,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.groups,
                ),
                label: 'Refer'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profle'),
          ],
        ),
      ),
    );
  }
}
