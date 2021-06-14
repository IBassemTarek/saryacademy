 

import 'package:cloud_firestore/cloud_firestore.dart';

class AlertModel {
    final String name;
    final int day;
    final int month;
    final int year;
    final bool showed;
    final String uid;
    final Timestamp dateTime;
    AlertModel({this.day,this.month,this.name,this.year,this.showed,this.uid,this.dateTime});
}
    // List<AlertModel> alerttemp = [];
    //     List<AlertModel> newAlerts = [];

