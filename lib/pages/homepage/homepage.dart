import 'package:flutter/material.dart';
import 'package:interviewVoiceApp/components/cachedImage.dart';
import 'package:interviewVoiceApp/components/textField.dart';
import 'package:interviewVoiceApp/properties/colors.dart';
import 'package:interviewVoiceApp/properties/images.dart';
import 'package:interviewVoiceApp/properties/strings.dart';

import 'widget/homepageFriend.dart';
import 'widget/homepageHeading.dart';
import 'widget/homepageRecommendedRoom.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARYCOLOR,
      appBar: AppBar(
        elevation: 0,
        title: Text(TITLE),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: cachedImage(
              context: context,
              height: 100,
              image: IMAGE1,
              width: 100,
            ),
          ),
        ),
        actions: [
          IconButton(
            color: BLACK,
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            color: BLACK,
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            homepageHeading(context: context),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: WHITE,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: textFieldWidget(
                prefixIcon: Icons.search,
                removeBorder: true,
                controller: null,
                focusNode: null,
                hintText: "Search",
              ),
            ),
            SizedBox(height: 10),
            homepageRecommendedRoom(context: context),
            SizedBox(height: 10),
            homepageFriend(context: context),
          ],
        ),
      ),
    );
  }
}
