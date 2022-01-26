// 0- سيء
// 1- ممتاز
// 2- جيد جدا
// 3- جيد

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class PRM3Listmodel {
  String studentNameA;
  String studentNameE;
  PRM3Listmodel({
    this.studentNameA,
    this.studentNameE,
  });
}

class PR3Grades {
  List academicSkills;
  List socialSkills;
  String pdf;
  List workHabits;
  List artSkills;
  List speakingSkills;
  List musicSkills;
  Timestamp date;
  PR3Grades({
    this.academicSkills,
    this.socialSkills,
    @required this.date,
    this.artSkills,
    this.musicSkills,
    this.pdf,
    this.speakingSkills,
    this.workHabits,
  });
}
