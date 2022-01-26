import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../../screens/PRS1/progressReportOption.dart';
import '../../const.dart';

class GradeAlert extends StatelessWidget {
  final String title;
  final int mounthNo;
  final BuildContext context;
  final int index;
  final int neededGradeIndex;
  GradeAlert({
    this.context,
    this.index,
    @required this.title,
    @required this.mounthNo,
    @required this.neededGradeIndex,
  });
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: Center(
        child: const LocaleText(
          'Progress Level',
          style: TextStyle(
            fontFamily: "arialRounded",
            fontSize: 21,
            color: Color(0xff041056),
          ),
        ),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Divider(),
          ProgressReportOption(
            neededGradeIndex: neededGradeIndex,
            gradeColor: kWorkingColor,
            gradeTitle: Locales.currentLocale(context).toString() == "ar"
                ? "سيء"
                : "Bad",
            title: title,
            mounthNo: mounthNo,
            index: index,
          ),
          Divider(),
          ProgressReportOption(
            neededGradeIndex: neededGradeIndex,
            gradeColor: kWorkingColor,
            gradeTitle: Locales.currentLocale(context).toString() == "ar"
                ? "جيد جدا"
                : "Very good",
            title: title,
            mounthNo: mounthNo,
            index: index,
          ),
          Divider(),
          ProgressReportOption(
            neededGradeIndex: neededGradeIndex,
            gradeColor: kGoodColor,
            gradeTitle: Locales.currentLocale(context).toString() == "ar"
                ? "ممتاز"
                : "Excellent",
            title: title,
            mounthNo: mounthNo,
            index: index,
          ),
          Divider(),
          ProgressReportOption(
            gradeColor: kNotApplicableColor,
            neededGradeIndex: neededGradeIndex,
            gradeTitle: Locales.currentLocale(context).toString() == "ar"
                ? "جيد"
                : "Good",
            title: title,
            mounthNo: mounthNo,
            index: index,
          ),
        ],
      ),
    );
  }
}
