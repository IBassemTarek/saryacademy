import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../const.dart';
import 'gradeIcon.dart';

class SkillScore extends StatelessWidget {
  SkillScore(
      {@required this.dataNotesAnswers,
      @required this.title,
      @required this.neededGradeIndex,
      @required this.index});
  final String title;
  final int neededGradeIndex;
  final int dataNotesAnswers;
  final int index;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Container(
      width: 0.02 * _width,
      child: Padding(
          padding: EdgeInsets.only(top: 2),
          child: () {
            if (dataNotesAnswers == 0)
              return Container(
                  child: GradeIcon(
                neededGradeIndex: neededGradeIndex,
                gradeColor: kWorkingColor,
                gradeTitle: Locales.currentLocale(context).toString() == "ar"
                    ? "سيء"
                    : "Bad",
                index: index,
                title: title,
                mounthNo: 1,
              ));
            else if (dataNotesAnswers == 3)
              return Container(
                  height: 0.0212 * _width,
                  child: GradeIcon(
                    neededGradeIndex: neededGradeIndex,
                    gradeColor: kNotApplicableColor,
                    gradeTitle:
                        Locales.currentLocale(context).toString() == "ar"
                            ? "جيد"
                            : "Good",
                    index: index,
                    title: title,
                    mounthNo: 1,
                  ));
            else if (dataNotesAnswers == 2)
              return Container(
                  height: 0.0212 * _width,
                  child: GradeIcon(
                    gradeColor: kWorkingColor,
                    neededGradeIndex: neededGradeIndex,
                    gradeTitle:
                        Locales.currentLocale(context).toString() == "ar"
                            ? "جيد جدا"
                            : "Very good",
                    index: index,
                    title: title,
                    mounthNo: 1,
                  ));
            else
              return Container(
                  height: 0.0212 * _width,
                  child: GradeIcon(
                    gradeColor: kGoodColor,
                    neededGradeIndex: neededGradeIndex,
                    gradeTitle:
                        Locales.currentLocale(context).toString() == "ar"
                            ? "ممتاز"
                            : "Excellent",
                    index: index,
                    title: title,
                    mounthNo: 1,
                  ));
          }()),
    );
  }
}
