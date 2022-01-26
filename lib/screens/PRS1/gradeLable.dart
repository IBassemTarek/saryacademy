import 'package:flutter/material.dart';

import '../../const.dart';
import 'gradeCircle.dart';

class GradeLable extends StatelessWidget {
  final Color gradeColor;
  final String gradeTitle;
  final double fontSize;
  GradeLable({this.gradeColor, this.gradeTitle, @required this.fontSize});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Container(
      width: 0.279 * _width,
      height: 0.0165 * _height,
      child: Row(
        children: [
          GradeCircle(
            gradeTitle: gradeTitle,
            gradeColor: gradeColor,
            size: 0.02 * _width,
          ),
          SizedBox(
            width: 0.02 * _width,
          ),
          Directionality(
              textDirection: TextDirection.rtl,
              child: Text(gradeTitle,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: kText2Color.withOpacity(1), fontSize: fontSize))),
        ],
      ),
    );
  }
}
