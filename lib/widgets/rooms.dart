import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';
import '../config/palette.dart';


class Rooms extends StatelessWidget {
  final List<User> onlineUsers;
  const Rooms({@required this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60.0,
      child: ListView.builder(
        itemCount: onlineUsers.length + 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
        if(index == 0) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 10.0,  horizontal: 8.0),
            child: _CreateRoomButton(),
          );
        }
        User user =  onlineUsers[index - 1];
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10.0,  horizontal: 8.0),
          child: ProfileAvatar(imageUrl: user.imageUrl, isActive: true),
        );
      }),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () => print('Create room'),
      color: Colors.white,
      borderSide: BorderSide(
        width: 3.0,
        color: Colors.blueAccent.shade100
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0)
      ),
      textColor: Palette.facebookBlue,
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) => Palette.createRoomGradient.createShader(rect),
            child: Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 3.0,),
          Text('Create\nRoom')
        ],
      ),
    );
  }
}

