import 'package:cloud_firestore/cloud_firestore.dart';

class AlertModel {
  final Timestamp dateTime;
  final String name;
  final int day;
  final int month;
  final int year;

  final bool showedT;
  final bool showedP;
  final String uid;
  final String parentMessId;
  final String teacherMessId;
  AlertModel(
      {this.day,
      this.month,
      this.name,
      this.year,
      this.showedP,
      this.showedT,
      this.parentMessId,
      this.teacherMessId,
      this.uid,
      this.dateTime});
}
    // List<AlertModel> alerttemp = [];
    //     List<AlertModel> newAlerts = [];

