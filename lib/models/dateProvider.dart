import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DateProvider extends ChangeNotifier {
  Timestamp date;
  changeDate(Timestamp newDate){
      date = newDate;
      notifyListeners();
  }
}