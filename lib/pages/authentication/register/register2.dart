import 'package:flutter/material.dart';
import 'package:interviewVoiceApp/components/textField.dart';
import 'package:interviewVoiceApp/properties/colors.dart';
import 'package:interviewVoiceApp/properties/styles.dart';

import 'uploadProfilePic.dart';

class Register2 extends StatelessWidget {
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
                Text("Enter your phone number", style: h3Black),
                SizedBox(height: 20),
                Text("Phone number", style: h4Black),
                SizedBox(height: 10),
                textFieldWidget(
                  controller: null,
                  focusNode: null,
                  hintText: "Enter your phone number",
                  inputType: TextInputType.phone,
                ),
                SizedBox(height: 50),
                Text(
                  "By entering your phone number, you're agreeing to our Terms of Service and Privacy Policy. Thanks!",
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
                        MaterialPageRoute(
                            builder: (context) => UploadProfilePicture()),
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
