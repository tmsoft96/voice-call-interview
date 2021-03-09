import 'package:flutter/material.dart';
import 'package:interviewVoiceApp/components/cachedImage.dart';
import 'package:interviewVoiceApp/pages/room/roomDetails.dart';
import 'package:interviewVoiceApp/properties/colors.dart';
import 'package:interviewVoiceApp/properties/images.dart';
import 'package:interviewVoiceApp/properties/styles.dart';

Widget homepageRecommendedRoom({@required BuildContext context}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Recommended Rooms", style: h4Black),
      SizedBox(height: 10),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RoomDetails(),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: WHITE,
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _images(context: context),
                Text("Educations", style: h4Black),
                Icon(Icons.arrow_forward_ios, size: 20),
              ],
            ),
          ),
        ),
      ),
      SizedBox(height: 10),
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: WHITE,
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _images(context: context),
              Text("Health & Fitness", style: h4Black),
              Icon(Icons.arrow_forward_ios, size: 20),
            ],
          ),
        ),
      ),
      SizedBox(height: 10),
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 30,
          width: double.maxFinite,
          color: WHITE,
          child: Icon(Icons.arrow_drop_down),
        ),
      )
    ],
  );
}

Widget _images({@required BuildContext context}) {
  return Stack(
    children: [
      ClipOval(
        child: cachedImage(
          context: context,
          height: 50,
          image: IMAGE1,
          width: 50,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 30),
        child: ClipOval(
          child: cachedImage(
            context: context,
            height: 50,
            image: IMAGE2,
            width: 50,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 50),
        child: Stack(
          children: [
            ClipOval(
              child: cachedImage(
                context: context,
                height: 50,
                image: IMAGE3,
                width: 50,
              ),
            ),
            ClipOval(
              child: Container(
                height: 50,
                width: 50,
                color: BLACK.withOpacity(.5),
                alignment: Alignment.center,
                child: Text("100+", style: h5White),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
