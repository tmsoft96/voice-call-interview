import 'dart:io';

import 'package:flutter/material.dart';
import 'package:interviewVoiceApp/properties/colors.dart';
import 'package:interviewVoiceApp/properties/images.dart';
import 'package:interviewVoiceApp/properties/styles.dart';
import 'package:interviewVoiceApp/utils/captureImage.dart';

class UploadProfilePicture extends StatefulWidget {
  @override
  _UploadProfilePictureState createState() => _UploadProfilePictureState();
}

class _UploadProfilePictureState extends State<UploadProfilePicture> {
  File imagePath;

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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Upload profile picture", style: h3Black),
                SizedBox(height: 60),
                Center(
                  child: ClipOval(
                    child: Container(
                      height: 160,
                      width: 160,
                      color: BLACK,
                      child: Image.asset(
                        BLANKIMAGE,
                        height: 160,
                        width: 160,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: ButtonTheme(
                    shape: Border.all(color: BLACK),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ImageCapture(),
                          ),
                        );
                      },
                      color: WHITE,
                      child: Text("Upload", style: h4Button),
                    ),
                  ),
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
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (context) => Register2()),
                      // );
                    },
                    color: BLUE,
                    textColor: WHITE,
                    child: Text("Complete"),
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
