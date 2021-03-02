import 'package:flutter/material.dart';
import 'package:interviewVoiceApp/properties/colors.dart';
import 'package:interviewVoiceApp/properties/strings.dart';
import 'package:interviewVoiceApp/properties/styles.dart';

import 'homepage/homepage.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _timer();
  }

  Future<void> _timer() async {
    await Future.delayed(Duration(seconds: 3), () async {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
          (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARYCOLOR,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.call,
              color: WHITE,
              size: 150,
            ),
            SizedBox(height: 10),
            Text("$TITLE", style: h3White),
          ],
        ),
      ),
    );
  }
}
