import 'package:flutter/material.dart';
import 'package:interviewVoiceApp/components/cachedImage.dart';
import 'package:interviewVoiceApp/properties/colors.dart';
import 'package:interviewVoiceApp/properties/images.dart';

Widget roomDetailsWidget({
  @required BuildContext context,
}) {
  return ClipRRect(
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
          _users(context: context, image: IMAGE3, name: "Tamakloe"),
          _users(context: context, image: IMAGE2, name: "Tata"),
          _users(context: context, image: IMAGE1, name: "Michael"),
          _users(context: context, image: IMAGE3, name: "Titi"),
          _users(context: context, image: IMAGE1, name: "Michael"),
          _users(context: context, image: IMAGE2, name: "Kofi"),
          _users(context: context, image: IMAGE3, name: "Tamakloe"),
          _users(context: context, image: IMAGE2, name: "Tata"),
          _users(context: context, image: IMAGE1, name: "Michael"),
          _users(context: context, image: IMAGE3, name: "Titi"),
          _users(context: context, image: IMAGE3, name: "Tamakloe"),
        ],
      ),
    ),
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
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.mic,
                        size: 15,
                        color: WHITE,
                      ),
                    ),
                  ),
                ),
              if (!online)
                Align(
                  alignment: Alignment.bottomRight,
                  child: ClipOval(
                    child: Container(
                      color: BLACK,
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.mic_off,
                        size: 15,
                        color: WHITE,
                      ),
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
