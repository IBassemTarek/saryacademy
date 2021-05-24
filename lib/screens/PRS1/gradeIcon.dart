import 'package:flutter/material.dart';

import '../../const.dart';

class GradeIcon extends StatelessWidget {
  GradeIcon({
    @required this.gradeTitle,
    @required this.gradeColor,
  });

  final String gradeTitle;
  final Color gradeColor;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Container(
      height:  0.02*_width ,
      width: 0.02*_width,
      decoration: (gradeTitle!="غير مقاس" && gradeTitle!="Unmeasured")
      ?roundedContainer(radius: 0.02*_width , color:gradeColor.withOpacity(1)).copyWith(boxShadow:[])
      :BoxDecoration(
        border: Border.all(width: 0.00151*_width, color: gradeColor.withOpacity(1)),
        borderRadius: BorderRadius.all(Radius.circular(0.01691*_width ) ),
        // color: Colors.black,/
      ),
    );
  }
}