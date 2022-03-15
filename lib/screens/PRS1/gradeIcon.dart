import 'package:flutter/material.dart';

import 'gradeCircle.dart';

class GradeIcon extends StatelessWidget {
  GradeIcon(
      {@required this.gradeTitle,
      @required this.gradeColor,
      @required this.index,
      @required this.title,
      @required this.mounthNo,
      @required this.neededGradeIndex});
  final String title;
  final int mounthNo;
  final String gradeTitle;
  final Color gradeColor;
  final int index;
  final int neededGradeIndex;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    return GradeCircle(
      gradeTitle: gradeTitle,
      gradeColor: gradeColor,
      size: 0.02 * _width,
    );
  }
}
