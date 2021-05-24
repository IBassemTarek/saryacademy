

import 'package:flutter/material.dart';

import '../../const.dart';
import 'gradeIcon.dart';

class GradeLable extends StatelessWidget {
  final Color gradeColor;
  final String gradeTitle;
  GradeLable({this.gradeColor,this.gradeTitle});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Container(
      width: 0.2*_width,
      height:0.0134*_height,
      child: Row(
        children: [
          GradeIcon( gradeTitle: gradeTitle, gradeColor: gradeColor),
          SizedBox(width: 0.01691*_width,),
          Directionality(textDirection: TextDirection.rtl,
          child: Text(gradeTitle,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText2Color.withOpacity(1),fontSize: 8))),
        ],
      ),
    );
  }
}

