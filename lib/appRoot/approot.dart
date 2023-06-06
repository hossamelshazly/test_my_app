import 'package:flutter/material.dart';
import '../home_screen/homescreen.dart';
class AppRoot extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: HomeScreen(),
    );
  }
}
