import 'package:flutter/material.dart';

//Components
import 'package:ratemycourse/components/customicons.dart';
import 'package:ratemycourse/components/textstyles.dart';
import 'package:ratemycourse/components/pallete.dart';

//Lib
import 'package:badges/badges.dart';

AppBar customAppBar(BuildContext context,
    {String title, Color color, bool backButton: true}) {
  return AppBar(
    automaticallyImplyLeading: false,
    titleSpacing: 0,
    leading: backButton
        ? IconButton(
            icon: Icon(CustomIcons.arrow, color: Colors.black, size: 8),
            onPressed: () => Navigator.of(context).pop(),
          )
        : null,
    title: Text(title, style: appBarStyle(color: color)),
    centerTitle: true,
  );
}

Badge badge(String text) {
  return Badge(
    badgeColor: Pallete.creativeMaroon,
    shape: BadgeShape.square,
    borderRadius: 19,
    toAnimate: false,
    badgeContent: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    ),
  );
}
