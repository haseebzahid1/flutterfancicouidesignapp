import 'dart:ui';
import 'package:fancicouidesign/screens/landingpage.dart';
import 'package:fancicouidesign/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {


  const MyApp({Key? key}) : super(key: key);




  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      double screenWidth = window.physicalSize.width;
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Design 1',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primaryColor: COLOR_WHITE, accentColor: COLOR_DARK_BLUE,
          textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
      ),


      home: const LandingPage(),
    );
  }
}
