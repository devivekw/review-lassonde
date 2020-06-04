import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Components
import 'package:ratemycourse/components/reusable.dart';
import 'package:ratemycourse/models/faculty.dart';

//Screen
import 'package:ratemycourse/screens/coursepage.dart';

class FacultyPage extends StatelessWidget {
  final Faculty faculty;
  Query collRef;
  String facultyTitle;
  Color facultyColor;
  String collectionName;

  FacultyPage(this.faculty) {
    facultyTitle = faculty.getTitle;

    facultyColor = faculty.getColor;
    collectionName = faculty.getCollectionName;
    collRef = Firestore.instance
        .collection(faculty.getCollectionName)
        .orderBy('code');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: facultyTitle,
        color: faculty.getColor,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: collRef.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) print("${snapshot.error}");
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Center(
                child: CircularProgressIndicator(
                  backgroundColor: facultyColor,
                ),
              );
            default:
              return new ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  final code = document['code'];
                  final title = document['title'];
                  final description = document['description'];
                  final docref = document.documentID;
                  return Card(
                    elevation: 5,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9.0)),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CoursePage(
                              code,
                              title,
                              description,
                              facultyColor,
                              docref,
                              collectionName,
                            ),
                          ),
                        );
                      },
                      leading: Text(
                        "$code",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      title: Text(
                        '$title',
                        style: TextStyle(
                          //fontSize: 18,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
          }
        },
      ),
      // bottomNavigationBar: GoogleNavBar(),
    );
  }
}
