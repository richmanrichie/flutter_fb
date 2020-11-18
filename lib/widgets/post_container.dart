import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/post_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({
    Key key,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                SizedBox(height: 8.0),
                Text(post.caption),
                post.imageUrl != null
                    ? SizedBox.shrink()
                    : SizedBox(
                        height: 6.0,
                      )
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(
                    imageUrl: post.imageUrl,
                  ),
                )
              : SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: _PostStats(post: post),
          )
        ],
      ),
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({
    Key key,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: Palette.facebookBlue, shape: BoxShape.circle),
              child: Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              '${post.shares} Shares',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            Expanded(
              child: _PostButton(
                  icon: Icon(
                    MdiIcons.thumbUpOutline,
                    color: Colors.grey.shade600,
                    size: 20.0,
                  ),
                  label: 'Like',
                  onTap: () => print('Like')),
            ),
            Expanded(
              child: _PostButton(
                  icon: Icon(
                    MdiIcons.commentOutline,
                    color: Colors.grey.shade600,
                    size: 20.0,
                  ),
                  label: 'Comment',
                  onTap: () => print('Comment')),
            ),
            Expanded(
              child: _PostButton(
                  icon: Icon(
                    MdiIcons.shareOutline,
                    color: Colors.grey.shade600,
                    size: 25.0,
                  ),
                  label: 'Share',
                  onTap: () => print('Share')),
            )
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const _PostButton({
    Key key,
    this.icon,
    this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4.0,),
                Text(label)
              ],
            ),
          )
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({
    Key key,
    this.post,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} . ',
                    style:
                        TextStyle(color: Colors.grey.shade600, fontSize: 12.0),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey.shade600,
                    size: 12.0,
                  ),
                ],
              )
            ],
          ),
        ),
        IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => print('More on the posts'))
      ],
    );
  }
}
