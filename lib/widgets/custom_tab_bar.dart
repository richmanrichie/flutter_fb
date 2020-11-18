import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final Function(int) onTap;
  final int selectedIndex;

  const CustomTabBar({
    Key key,
    this.icons,
    this.onTap,
    this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
          border:
              Border(top: BorderSide(color: Palette.facebookBlue, width: 5.0))),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(
                      e,
                      color: i == selectedIndex ? Palette.facebookBlue : Colors.black,
                  ),
                ),
              ))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
