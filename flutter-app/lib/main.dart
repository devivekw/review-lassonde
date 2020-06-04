import 'package:flutter/material.dart';

//Theme
import 'package:ratemycourse/theme.dart';

//Screens
import 'package:ratemycourse/screens/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rate My Course',
      theme: appTheme(),
      home: HomePage(),
    );
  }
}
