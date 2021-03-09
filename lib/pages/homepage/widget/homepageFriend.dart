import 'package:flutter/material.dart';
import 'package:interviewVoiceApp/components/cachedImage.dart';
import 'package:interviewVoiceApp/properties/colors.dart';
import 'package:interviewVoiceApp/properties/images.dart';
import 'package:interviewVoiceApp/properties/styles.dart';

Widget homepageFriend({
  @required BuildContext context,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Friends", style: h4Black),
      SizedBox(height: 10),
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(10),
          color: WHITE,
          child: Wrap(
            runSpacing: 5,
            spacing: 5,
            children: [
              _users(context: context, image: IMAGE1, name: "Michael"),
              _users(
                context: context,
                image: IMAGE2,
                name: "Kofi",
                online: true,
              ),
              _users(context: context, image: IMAGE3, name: "Tamakloe"),
              _users(context: context, image: IMAGE2, name: "Tata"),
              _users(context: context, image: IMAGE1, name: "Michael"),
              _users(context: context, image: IMAGE3, name: "Titi"),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _users({
  @required BuildContext context,
  @required String image,
  @required String name,
  bool online = false,
}) {
  return Container(
    padding: EdgeInsets.only(left: 5),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
          child: Stack(
            children: [
              ClipOval(
                child: cachedImage(
                  context: context,
                  height: 60,
                  image: image,
                  width: 60,
                ),
              ),
              if (online)
                Align(
                  alignment: Alignment.bottomRight,
                  child: ClipOval(
                    child: Container(
                      color: GREEN,
                      width: 10,
                      height: 10,
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                )
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(
          "$name",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ],
    ),
  );
}
