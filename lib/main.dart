import 'package:flutter/material.dart';

import 'package:saryacademy/screens/landingScreen.dart';
import 'package:saryacademy/const.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sary Academy',
      theme: textData(),
      home: LandingScreen(),
    );
  }
}

