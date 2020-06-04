import 'package:flutter/material.dart';
import 'package:ratemycourse/models/faculty.dart';

// Faculty Page
import 'package:ratemycourse/screens/facultypage.dart';

// Components
import 'package:ratemycourse/components/pallete.dart';
import 'package:ratemycourse/components/textstyles.dart';
import 'package:ratemycourse/components/reusable.dart';

// Models
import 'package:ratemycourse/models/facultydata.dart';

class HomePage extends StatelessWidget {
  static String heading = "Select a Faculty";

  Widget _facultyButton(BuildContext context, Faculty faculty) {
    final List<String> titlewrap = faculty.getTitle.split(" ");

    return SizedBox(
      height: 98,
      width: 98,
      child: RaisedButton(
        splashColor: faculty.getColor,
        color: Pallete.backgroundGrey,
        elevation: 10,
        hoverElevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FacultyPage(faculty)),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              faculty.getIcon,
              color: Colors.black,
              size: 40,
            ),
            SizedBox(height: 2),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              children: titlewrap
                  .map((title) => Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emptyFacultyButton() {
    return SizedBox(
      height: 82,
      width: 82,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: heading,
        color: Pallete.passionateRed,
        backButton: false,
      ),
      body: Center(
        child: Container(
          width: 320,
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Lassonde",
                style: facultyButtonStyle(),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _facultyButton(context, FacultyData.eecs),
                  _facultyButton(context, FacultyData.mech),
                  _facultyButton(context, FacultyData.civil),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _facultyButton(context, FacultyData.eng),
                  _facultyButton(context, FacultyData.esse),
                  _emptyFacultyButton(),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Science",
                style: facultyButtonStyle(),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _facultyButton(context, FacultyData.math),
                  _facultyButton(context, FacultyData.phys),
                  _emptyFacultyButton(),
                ],
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Goog  leNavBar(),
    );
  }
}
