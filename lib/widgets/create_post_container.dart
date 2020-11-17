import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/widgets/post_action_buttons.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';

class CreatePostContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl),
                const SizedBox(width: 30.0),
                Expanded(child:
                  TextField(
                   decoration: InputDecoration.collapsed(hintText: "Whats on your mind"),
                  )
                ),
              ],
            ),
            Divider(height: 10.0, thickness: 0.5,),
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton.icon(
                      onPressed: () => print('Next'),
                      icon: Icon(
                        Icons.videocam,
                        color: Colors.red,
                      ),
                      label: Text('Live')
                  ),
                  VerticalDivider(width: 8.0,),
                  FlatButton.icon(
                      onPressed: () => print('Next'),
                      icon: Icon(
                          Icons.photo_library,
                          color: Colors.green,
                      ),
                      label: Text('Photo')
                  ),
                  VerticalDivider(width: 8.0,),
                  FlatButton.icon(
                      onPressed: () => print('Next'),
                      icon: Icon(
                        Icons.video_call,
                        color: Colors.purpleAccent,
                      ),
                      label: Text('Video')
                  ),
                  VerticalDivider(width: 8.0,),
                ],
              ),
            )
          ],
        ),
      );
  }
}
