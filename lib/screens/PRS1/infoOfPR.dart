import 'package:flutter/material.dart';
import 'package:saryacademy/screens/PRS1/skillScore.dart';

import '../../const.dart';

class PRInfo extends StatelessWidget {
  final double dividerHeight;
  final String title;
  final bool english;
  final List<String> dataNotes;
  final List dataNotesAnswersMonth1,dataNotesAnswersMonth2,dataNotesAnswersMonth3;
  PRInfo({this.title,this.dataNotes,this.english,this.dataNotesAnswersMonth1,this.dataNotesAnswersMonth2,this.dataNotesAnswersMonth3,this.dividerHeight});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          child: Align(
            alignment:english?Alignment.centerLeft:Alignment.centerRight,
            child: Text(title,style: Theme.of(context).textTheme.subtitle2.copyWith( color:kText2Color.withOpacity(1),fontSize: 18))),

          ),
          SizedBox(height:0.0169*_width),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width:0.4189*_width,
                child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap:true,
                    itemCount: dataNotes.length,
                    separatorBuilder: (context,i)=>  SizedBox(height:0.009393*_height,),
                    itemBuilder: (context,i)=> Align(
                      alignment:english?Alignment.centerLeft:Alignment.centerRight,
                      child: FittedBox(fit: BoxFit.scaleDown,child: Text(dataNotes[i],style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText4Color.withOpacity(1),fontSize: 11))))
                  ),
              ),
              SkillScore( dataNotesAnswers: dataNotesAnswersMonth1,title: title,mounthNo: 1,),
              Container(
                height: dividerHeight,
                width: 1,
                color: kGreyColor.withOpacity(1),
              ),
              SkillScore( dataNotesAnswers: dataNotesAnswersMonth2,title: title,mounthNo: 2,),
              
              Container(
                height: dividerHeight,
                width: 1,
                color: kGreyColor.withOpacity(1),
              ),
              SkillScore( dataNotesAnswers: dataNotesAnswersMonth3,title: title,mounthNo: 3,),

            ],
          )
      ],
    );
  }
}
