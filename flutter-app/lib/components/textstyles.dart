import 'package:flutter/material.dart';

// Palatte
import 'package:ratemycourse/components/pallete.dart';

const String fontFamilia = 'Avenir';

TextStyle appBarStyle({Color color = Pallete.creativeMaroon}) {
  return TextStyle(
    // fontFamily: fontFamilia,
    color: color,
    fontWeight: FontWeight.w800,
    fontSize: 25.0,
  );
}

TextStyle paragraphHeadingStyle() {
  return TextStyle(
    // fontFamily: fontFamilia,
    color: Pallete.paragraphHeadingGrey,
    fontSize: 23,
    fontWeight: FontWeight.w800,
  );
}

TextStyle paragraphBodyStyle() {
  return TextStyle(
    color: Pallete.paragraphBodyGrey,
    fontSize: 15,
    fontWeight: FontWeight.w300,
  );
}

TextStyle facultyButtonStyle() {
  return TextStyle(
    fontFamily: "Avenir",
    fontSize: 18,
    color: new Color(0XFF3A3A3A),
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
  );
}

TextStyle reviewParagraphStyle() {
  return TextStyle(
    fontSize: 18,
    color: new Color(0xFF5F5F5F),
    fontFamily: "Avenir",
    fontWeight: FontWeight.w500,
  );
}
