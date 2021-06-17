import 'package:flutter/material.dart';

import '../../../screens/PRS1/progressReportOption.dart';
import '../../const.dart';

class GradeAlert extends StatelessWidget {
  final String title;
  final int mounthNo; 
final BuildContext context; 
final int index; 
GradeAlert({
  this.context,
   this.index ,
    @required this.title,
    @required this.mounthNo,
    });
  @override
  Widget build(BuildContext context) { 
    return new AlertDialog(
      title: const Text('Progress Level',textAlign: TextAlign.center,style:TextStyle(
                fontFamily: "arialRounded",
                fontSize: 21,
                color: Color(0xff041056),
              ),),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[ 
          Divider(),
          ProgressReportOption(gradeColor: kWorkingColor,gradeTitle:"Unmeasured" ,title: title,mounthNo: mounthNo,index: index, ),
          Divider(),
          ProgressReportOption(gradeColor: kWorkingColor,gradeTitle:"Working on Skill",title: title,mounthNo: mounthNo, index: index, ),
          Divider(),
          ProgressReportOption(gradeColor: kGoodColor,gradeTitle:"Good Progress",title: title,mounthNo: mounthNo, index: index, ),
          Divider(),
          ProgressReportOption(gradeColor: kNotApplicableColor,gradeTitle:"Not Applicable" ,title: title,mounthNo: mounthNo,index: index, ), 
        ],
      ),
 
    );
  }
}
