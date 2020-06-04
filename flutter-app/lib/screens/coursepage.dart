import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ratemycourse/components/reusable.dart';

import 'reviewpage.dart';

// Components
import 'package:ratemycourse/components/textstyles.dart';

class CoursePage extends StatelessWidget {
  final String code;
  final String name;
  final String description;
  final Color color;
  final String docref;
  final String collectionName;

  static Widget temp;

  CoursePage(
    this.code,
    this.name,
    this.description,
    this.color,
    this.docref,
    this.collectionName,
  ) {
    temp = Container(
      padding: EdgeInsets.only(left: 40, right: 40, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              name,
              textAlign: TextAlign.left,
              style: paragraphHeadingStyle(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              description,
              style: paragraphBodyStyle(),
            ),
          ),
        ],
      ),
    );
  }

  Widget badge(String text, Color color) {
    return Badge(
      badgeColor: color,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: code,
        color: color,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection(collectionName)
            .document(docref)
            .collection("reviews")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return temp;
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: new CircularProgressIndicator());
            default:
              return new ListView(
                children: [temp] +
                    snapshot.data.documents.map((doc) {
                      List<Widget> badges = [];

                      for (var option in doc["options"]) {
                        badges.add(badge(option, color));
                      }

                      return Container(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                        child: new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(9)),
                          ),
                          elevation: 5,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // alignment: WrapAlignment.spaceBetween,
                                  // crossAxisAlignment: WrapCrossAlignment.start,
                                  children: <Widget>[
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      spacing: 5,
                                      runSpacing: 5,
                                      children: badges,
                                    ),
                                    Text(
                                      doc["value"].toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: EdgeInsets.only(left: 3),
                                  child: Text(
                                    doc["text"],
                                    style: TextStyle(
                                      fontSize: 15.2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: color,
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: Text(
          "Add",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReviewPage(
                code: code,
                color: color,
                docref: docref,
                collectionName: collectionName,
              ),
            ),
          );
        },
      ),
    );
  }
}
