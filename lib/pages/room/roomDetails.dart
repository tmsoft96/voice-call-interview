import 'package:flutter/material.dart';
import 'package:interviewVoiceApp/pages/room/widget/roomDetailsWidget.dart';
import 'package:interviewVoiceApp/properties/colors.dart';
import 'package:interviewVoiceApp/properties/styles.dart';

import 'widget/roomDetailsBottom.dart';

class RoomDetails extends StatefulWidget {
  @override
  _RoomDetailsState createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {
  bool isJoin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARYCOLOR,
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            color: BLACK,
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Education", style: h3Black),
              SizedBox(height: 20),
              roomDetailsWidget(context: context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: roomDetailsBottom(
        isJoin: isJoin,
        onJoin: () => setState(() => isJoin = true),
        onLeave: () {},
        context: context,
      ),
    );
  }
}
