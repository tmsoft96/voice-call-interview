import 'package:flutter/material.dart';

import 'pages/splashScreen.dart';
import 'properties/colors.dart';
import 'properties/strings.dart';


void main() async => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: PRIMARYCOLOR,
      ),
      title: TITLE,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
