import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DateProvider extends ChangeNotifier {
  Timestamp date = Timestamp.fromDate(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));
  changeDate(Timestamp newDate) {
    date = newDate;
    notifyListeners();
  }
}
