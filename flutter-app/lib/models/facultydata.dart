import 'package:ratemycourse/components/customicons.dart';
import 'package:ratemycourse/models/faculty.dart';
import 'package:ratemycourse/components/pallete.dart';

class FacultyData {
  static Faculty eecs = new Faculty(
    'Computer Science',
    CustomIcons.EECS,
    'EECS',
    Pallete.creativeMaroon,
  );

  static Faculty civil = new Faculty(
    'Civil Engineering',
    CustomIcons.CIVIL,
    'CIVIL',
    Pallete.confidentGreen,
  );

  static Faculty mech = new Faculty(
    'Mechanical Engineering',
    CustomIcons.MECH,
    'MECH',
    Pallete.passionateRed,
  );

  static Faculty eng = new Faculty(
    'Engineering',
    CustomIcons.ENG,
    'ENG',
    Pallete.ingeniousYellow,
  );

  static Faculty esse = new Faculty(
    'Earth and Space Sciences',
    CustomIcons.ESSE,
    'ESSE',
    Pallete.rationalBlue,
  );

  static Faculty math = new Faculty(
    'Math',
    CustomIcons.MATH,
    'MATH',
    Pallete.pawkPurple,
  );

  static Faculty phys = new Faculty(
    'Physics',
    CustomIcons.PHYS,
    'PHYS',
    Pallete.physicsTeal,
  );
}
