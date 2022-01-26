import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../const.dart';
import 'gradeIcon.dart';

class SkillScore extends StatelessWidget {
  SkillScore(
      {@required this.dataNotesAnswers,
      @required this.title,
      @required this.mounthNo,
      @required this.neededGradeIndex});
  final String title;
  final int mounthNo;
  final int neededGradeIndex;
  final List dataNotesAnswers;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Container(
      width: 0.02 * _width,
      child: Padding(
        padding: EdgeInsets.only(top: 2),
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: dataNotesAnswers.length,
            separatorBuilder: (context, i) => SizedBox(
                  height: _height * 0.04,
                ),
            itemBuilder: (context, i) {
              if (dataNotesAnswers[i] == 0)
                return Container(
                    child: GradeIcon(
                  neededGradeIndex: neededGradeIndex,
                  gradeColor: kWorkingColor,
                  gradeTitle: Locales.currentLocale(context).toString() == "ar"
                      ? "سيء"
                      : "Bad",
                  index: i,
                  title: title,
                  mounthNo: mounthNo,
                ));
              else if (dataNotesAnswers[i] == 3)
                return Container(
                    height: 0.0212 * _width,
                    child: GradeIcon(
                      neededGradeIndex: neededGradeIndex,
                      gradeColor: kNotApplicableColor,
                      gradeTitle:
                          Locales.currentLocale(context).toString() == "ar"
                              ? "جيد"
                              : "Good",
                      index: i,
                      title: title,
                      mounthNo: mounthNo,
                    ));
              else if (dataNotesAnswers[i] == 2)
                return Container(
                    height: 0.0212 * _width,
                    child: GradeIcon(
                      gradeColor: kWorkingColor,
                      neededGradeIndex: neededGradeIndex,
                      gradeTitle:
                          Locales.currentLocale(context).toString() == "ar"
                              ? "جيد جدا"
                              : "Very good",
                      index: i,
                      title: title,
                      mounthNo: mounthNo,
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
                      index: i,
                      title: title,
                      mounthNo: mounthNo,
                    ));
            }),
      ),
    );
  }
}
