import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';

class Stories extends StatelessWidget {
  final List<Story> stories;
  final User currentUser;
  const Stories({
      Key key,
      @required this.stories,
      @required this.currentUser
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.white,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 5.0
          ),
          itemCount: stories.length + 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            if(index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: _StoryCard(
                  isAddStory: true,
                  currentUser: currentUser,
                ),
              );
            }
            Story story = stories[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(
                story: story,
              ),
            );
          }),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User currentUser;
  final Story story;

  const _StoryCard({Key key, this.isAddStory = false, this.currentUser, this.story}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser.imageUrl: story.imageUrl,
            width: 110.0,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0)
          ),
        ),
        Positioned(
            top: 8.0,
            left: 8.0,
            child: isAddStory ? Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => print('Add Story'),
                icon: Icon(Icons.add),
                iconSize: 30.0,
                color: Palette.facebookBlue,
              ),
            ): ProfileAvatar(
                imageUrl: story.user.imageUrl,
                hasBorder: !story.isViewed,
            )
        ),
        Positioned(
            bottom: 8.0,
            left: 8.0,
            right: 8.0,
            child: Text(
              isAddStory ? 'Add to Story' : story.user.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
        ),
      ],
    );
  }
}

