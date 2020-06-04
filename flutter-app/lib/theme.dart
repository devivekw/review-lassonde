import 'package:flutter/material.dart';

import 'package:ratemycourse/components/pallete.dart';

ThemeData appTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Pallete.creativeMaroon,
    accentColor: Pallete.backgroundGrey,
    backgroundColor: Pallete.backgroundGrey,
    
    //App theme
    appBarTheme: AppBarTheme(
      color: Colors.grey[50],
      elevation: 0,
    ),

    //Font family
    fontFamily: "Avenir",
  );
}
