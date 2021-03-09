import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:interviewVoiceApp/properties/colors.dart';
import 'package:interviewVoiceApp/properties/images.dart';

Widget cachedImage({
  @required BuildContext context,
  @required String image,
  @required double height,
  @required double width,
  String placeholder = DEFAULTIMAGE,
  BoxFit fit = BoxFit.fill,
}) {
  return CachedNetworkImage(
    height: height,
    width: width,
    fit: fit,
    errorWidget: (widget, text, error) {
      return cachedImage(
        context: context,
        image: placeholder,
        height: height,
        width: width,
      );
    },
    progressIndicatorBuilder: (context, url, progress) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(BLACK),
            value: progress.progress,
          ),
        ),
      ],
    ),
    imageUrl: image,
  );
}
