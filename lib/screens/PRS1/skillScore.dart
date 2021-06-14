import 'package:flutter/material.dart';

import '../../const.dart';
import 'gradeIcon.dart';

class SkillScore extends StatelessWidget {
  SkillScore({
    @required this.dataNotesAnswers,
    @required this.title,
    @required this.mounthNo,
  });
  final String title;
  final int mounthNo;
  final List dataNotesAnswers;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Container(
      width: 0.02*_width,
      child: Padding(
        padding: EdgeInsets.only(top: 2),
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap:true,
            itemCount: dataNotesAnswers.length,
            separatorBuilder: (context,i)=> SizedBox(height:0.016*_height,),
            itemBuilder: (context,i) {
              if (dataNotesAnswers[i]==0)
              return Container(
                height:0.0212*_width,
                child: GradeIcon(gradeColor: kWorkingColor,gradeTitle: "Unmeasured",index: i,title: title,mounthNo: mounthNo,));
              else if (dataNotesAnswers[i]==3)
              return Container(
                height:0.0212*_width,
                child: GradeIcon(gradeColor: kNotApplicableColor,gradeTitle: "Not Applicable",index: i,title: title,mounthNo: mounthNo,));
              else if (dataNotesAnswers[i]==2)
              return Container(
                height:0.0212*_width,
                child: GradeIcon(gradeColor: kWorkingColor,gradeTitle: "Working on Skill",index: i,title: title,mounthNo: mounthNo,));
              else 
              return Container(
                height:0.0212*_width,
                child: GradeIcon(gradeColor: kGoodColor,gradeTitle: "Good Progress",index: i,title: title,mounthNo: mounthNo,));
            }
          ),
      ),
    );
  }
}

