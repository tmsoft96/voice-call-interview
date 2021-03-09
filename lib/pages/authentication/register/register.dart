import 'package:flutter/material.dart';
import 'package:interviewVoiceApp/components/textField.dart';
import 'package:interviewVoiceApp/properties/colors.dart';
import 'package:interviewVoiceApp/properties/styles.dart';

import 'register2.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARYCOLOR,
      appBar: AppBar(elevation: 0),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Enter your name", style: h3Black),
                SizedBox(height: 20),
                Text("First Name", style: h4Black),
                SizedBox(height: 10),
                textFieldWidget(
                  controller: null,
                  focusNode: null,
                  hintText: "Enter your first name",
                ),
                SizedBox(height: 10),
                Text("Last Name", style: h4Black),
                SizedBox(height: 10),
                textFieldWidget(
                  controller: null,
                  focusNode: null,
                  hintText: "Enter your last name",
                ),
                SizedBox(height: 50),
                Text(
                  "By entering your name, you're agreeing to our Terms of Service and Privacy Policy. Thanks!",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                ButtonTheme(
                  height: 40,
                  minWidth: 400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Register2()),
                      );
                    },
                    color: BLUE,
                    textColor: WHITE,
                    child: Text("Continue"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
