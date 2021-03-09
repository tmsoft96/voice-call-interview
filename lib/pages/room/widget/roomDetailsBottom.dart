import 'package:flutter/material.dart';
import 'package:interviewVoiceApp/properties/colors.dart';
import 'package:interviewVoiceApp/properties/styles.dart';

Widget roomDetailsBottom({
  @required void Function() onJoin,
  @required bool isJoin,
  @required void Function() onLeave,
  @required BuildContext context,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: ListTile(
            tileColor: GREEN,
            title: Text("Send an Invitation", style: h5White),
            trailing: Icon(Icons.add, color: WHITE),
          ),
        ),
      ),
      SizedBox(height: 20),
      Container(
        decoration: BoxDecoration(
          color: BLACK1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        width: double.maxFinite,
        padding: EdgeInsets.all(10),
        child: isJoin
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonTheme(
                    height: 60,
                    minWidth: MediaQuery.of(context).size.width * .5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: WHITE),
                    ),
                    child: FlatButton(
                      textColor: WHITE,
                      onPressed: onLeave,
                      child: Text("Leave Room", style: h4Button),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Text(
                          "✋",
                          style: TextStyle(fontSize: 30),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        icon: Icon(
                          Icons.mic,
                          color: WHITE,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              )
            : ButtonTheme(
                height: 60,
                minWidth: 400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: WHITE),
                ),
                child: FlatButton(
                  textColor: WHITE,
                  onPressed: onJoin,
                  child: Text("Join Room", style: h4Button),
                ),
              ),
      ),
    ],
  );
}
