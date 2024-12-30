import 'package:flutter/material.dart';
import 'package:machine_app/home_and_homescreen/buttomNavigatorbar.dart';

class MyHomePage extends StatelessWidget {
  final Function toggleTheme;

  const MyHomePage({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return BottomNavigation(toggleTheme: toggleTheme);
  }
}
