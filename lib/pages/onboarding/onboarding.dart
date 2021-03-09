import 'package:flutter/material.dart';
import 'package:interviewVoiceApp/pages/authentication/register/register.dart';
import 'package:interviewVoiceApp/properties/colors.dart';
import 'package:interviewVoiceApp/properties/images.dart';
import 'package:interviewVoiceApp/properties/strings.dart';
import 'package:interviewVoiceApp/properties/styles.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARYCOLOR,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(WELCOME),
              SizedBox(height: 40),
              Text(TITLE, style: h3Black),
              SizedBox(height: 20),
              Text(
                "We're woking had to get $TITLE ready for everyone! While we wrap up the finishing touches, we're adding people gradually to meet sure nothing break. :) \n\n Anyone can join with an invite from an exiting user or register to continue.",
                style: h4Black,
              ),
              SizedBox(height: 60),
              ButtonTheme(
                height: 40,
                minWidth: 400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FlatButton(
                  onPressed: () {},
                  color: BLUE,
                  textColor: WHITE,
                  child: Text("Join with invite"),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                  textColor: BLACK,
                  child: Text("Register", style: h4Button),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
