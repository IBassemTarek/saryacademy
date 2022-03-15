import 'package:flutter/widgets.dart';

class ReportType extends ChangeNotifier {
  String reportType;

  changeReportType(String value) {
    reportType = value;
    notifyListeners();
  }
}
