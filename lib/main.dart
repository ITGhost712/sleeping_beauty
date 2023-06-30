import 'package:flutter/material.dart';
import 'package:sleeping_beauty/home_screen.dart';

void main() {
  runApp(SleepingBeauty());
}
class SleepingBeauty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


