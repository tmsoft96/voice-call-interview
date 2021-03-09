import 'package:flutter/material.dart';
import 'package:interviewVoiceApp/components/cachedImage.dart';
import 'package:interviewVoiceApp/properties/colors.dart';
import 'package:interviewVoiceApp/properties/images.dart';

Widget homepageHeading({
  @required BuildContext context,
}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        _createRoom(),
        _onlineUsers(context: context, image: IMAGE2, name: "Michael"),
        _onlineUsers(context: context, image: IMAGE3, name: "Kofi"),
        _onlineUsers(context: context, image: IMAGE1, name: "Tamakloe"),
        _onlineUsers(context: context, image: IMAGE2, name: "Michael"),
        _onlineUsers(context: context, image: IMAGE2, name: "Michael"),
        _onlineUsers(context: context, image: IMAGE3, name: "Kofi"),
        _onlineUsers(context: context, image: IMAGE1, name: "Tamakloe"),
        _onlineUsers(context: context, image: IMAGE2, name: "Michael"),
      ],
    ),
  );
}

Widget _createRoom() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CircleAvatar(
        backgroundColor: WHITE,
        minRadius: 25,
        child: Icon(Icons.add_business, color: BLACK),
      ),
      SizedBox(height: 10),
      Text(
        "Create Room",
        style: TextStyle(fontWeight: FontWeight.w700),
      )
    ],
  );
}

Widget _onlineUsers({
  @required BuildContext context,
  @required String image,
  @required String name,
}) {
  return Container(
    padding: EdgeInsets.only(left: 5),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          child: Stack(
            children: [
              ClipOval(
                child: cachedImage(
                  context: context,
                  height: 50,
                  image: image,
                  width: 50,
                ),
              ),
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
