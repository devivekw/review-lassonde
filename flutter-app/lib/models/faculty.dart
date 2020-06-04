import 'package:flutter/material.dart';

class Faculty {
  String title;
  IconData icon;
  String collectionName;
  Color color;

  Faculty(this.title, this.icon, this.collectionName, this.color);

  get getTitle {
    return this.title;
  }

  get getIcon {
    return this.icon;
  }

  get getCollectionName {
    return this.collectionName;
  }

  get getColor {
    return this.color;
  }
}
