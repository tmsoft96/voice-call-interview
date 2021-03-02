import 'package:flutter/material.dart';
import 'package:interviewVoiceApp/components/cachedImage.dart';
import 'package:interviewVoiceApp/properties/colors.dart';
import 'package:interviewVoiceApp/properties/images.dart';
import 'package:interviewVoiceApp/properties/styles.dart';

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
        centerTitle: true,
        elevation: .2,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Call Room", style: h4WhiteBold),
            Text("10 member", style: h6White)
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: WHITE),
            onPressed: () {},
          ),
        ],
      ),
      body: _membersRoom(),
      bottomNavigationBar: _buttonButtons(),
    );
  }

  Widget _buttonButtons() {
    return Container(
      constraints: BoxConstraints(maxHeight: 150),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buttonRound(color: BLUE, icon: Icons.volume_up),
          _buttonRound(color: BLUE2, icon: Icons.mic_off, isBig: true),
          _buttonRound(color: RED, icon: Icons.call_end),
        ],
      ),
    );
  }

  Widget _buttonRound({
    @required IconData icon,
    @required Color color,
    bool isBig = false,
  }) {
    return CircleAvatar(
      backgroundColor: color,
      radius: isBig ? 45 : 30,
      child: Icon(icon, color: WHITE, size: isBig ? 40 : null),
    );
  }

  Widget _membersRoom() {
    return Container(
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: PRIMARYCOLOR1,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _inviteMember(),
                Divider(color: WHITE, thickness: .3),
                _members(
                  image: IMAGE1,
                  name: "Michael",
                  isSpeaking: true,
                ),
                _members(image: IMAGE2, name: "Kofi"),
                _members(image: IMAGE3, name: "Tamakloe"),
                _members(image: IMAGE1, name: "John"),
                _members(image: IMAGE2, name: "Kofi"),
                _members(image: IMAGE3, name: "Tamakloe"),
                _members(image: IMAGE1, name: "John"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _members({
    @required String image,
    @required String name,
    bool isSpeaking = false,
  }) {
    return Column(
      children: [
        ListTile(
          leading: ClipOval(
            child: cachedImage(
              context: context,
              image: image,
              height: 50,
              width: 50,
            ),
          ),
          title: Text("$name", style: h5White),
          subtitle: isSpeaking
              ? Text("speaking", style: h6Green)
              : Text("listening", style: h6Blue),
          trailing: IconButton(
            icon: Icon(
              isSpeaking ? Icons.mic : Icons.mic_off,
              color: isSpeaking ? GREEN : WHITE,
            ),
            onPressed: () {},
          ),
        ),
        Divider(color: WHITE, thickness: .3),
      ],
    );
  }

  Widget _inviteMember() {
    return ListTile(
      onTap: () {},
      leading: Icon(
        Icons.supervised_user_circle_rounded,
        color: WHITE,
        size: 40,
      ),
      title: Text("Invite Member", style: h5White),
    );
  }
}
