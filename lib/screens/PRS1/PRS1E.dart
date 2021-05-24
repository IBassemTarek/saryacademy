import 'package:flutter/material.dart';
import 'package:saryacademy/models/progressReportModel2.dart';
import 'package:saryacademy/shared/backArrowBotton.dart';

import '../../const.dart';
import 'gradeLable.dart';
import 'infoOfPR.dart';
import 'langAndPdf.dart';

class PRS1E extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kbackgroundColor.withOpacity(1),
      appBar: AppBar(
        leading: BackArrowBotton(),
        centerTitle: false,
        titleSpacing: 0,
        elevation:0,
        backgroundColor: Colors.transparent,
        title: Text("Progress Report",style: Theme.of(context).textTheme.headline1.copyWith( color:kIconColor.withOpacity(1),fontSize: 30)),
      ),
      body:Stack(
          alignment: Alignment.center,
          children: [
      Align(
        alignment: Alignment.topRight,
        child: Image.asset("assets/images/PR/PRdec1.png")),
 Container(
          padding: EdgeInsets.symmetric(horizontal: 0.0483092*_width ,vertical: 0.02*_height),
          margin: EdgeInsets.symmetric(horizontal: 0.0483092*_width ),
          height:0.78125*_height,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40) ),
          color: Colors.white,
          ),
          child: ListView(
            padding: EdgeInsets.only(bottom: 0.017857*_height),
            children: [
              Row(
                children: [
                  Text("${prM2modeltest.studentNameE}`s Report",style: Theme.of(context).textTheme.headline1.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 22)),
                  Spacer(),
                  Column(
                    children: [
                      GradeLable(gradeColor: kGoodColor,gradeTitle:"Good Progress" ,),
                      GradeLable(gradeColor: kWorkingColor,gradeTitle:"Working on Skill" ,),
                      GradeLable(gradeColor: kNotApplicableColor,gradeTitle:"Not Applicable" ,),
                      GradeLable(gradeColor: kWorkingColor,gradeTitle:"Unmeasured" ,)
                    ],
                  ),

                ],
              ), 
              SizedBox(height:0.0169*_width),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: 0.4*_width,
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    width:0.3*_width,
                                    child: LangAndPdf(lang: 'Arabic',)),
                                  SizedBox(height:0.0169*_width),
                     Container(
                       height: 0.02232*_height,
                       width:0.3*_width ,
                       decoration: roundedContainer(color: kIconColor.withOpacity(1),radius: 20.0).copyWith(boxShadow: []),
                       child: Center(child: Text("Preschool Stage 1",style: Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.white,fontSize: 12))),
                       ),

                                ],
                              ),
                            ),
                          ),
                        ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               Container(
                                 margin: EdgeInsets.only(right:0.06*_width),
                                 width: 0.239130435*_width,
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text(prM2modeltest.month1E,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText2Color.withOpacity(1),fontSize: 12)),
                                     Text(prM2modeltest.month2E,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText2Color.withOpacity(1),fontSize: 12)),
                                     Text(prM2modeltest.month3E,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText2Color.withOpacity(1),fontSize: 12))
                                   ],
                         ),
                               ),
                             ],
                           ),
                  SizedBox(height:0.0169*_width),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 0.0111607*_width, horizontal: 0.02*_height),
                      height:0.222893*_height,
                      width:0.763285*_width,
                      decoration: roundedContainer(color: Colors.white,radius: 20.0),
                      child:PRInfo(title:"Social skills",
                      dataNotes: prS1ESocialSkills,
                      english: true,
                      dataNotesAnswersMonth1: prM2modeltest.allMonthsReports[0].socialSkills,
                      dataNotesAnswersMonth2: prM2modeltest.allMonthsReports[1].socialSkills,
                      dataNotesAnswersMonth3: prM2modeltest.allMonthsReports[2].socialSkills,
                      dividerHeight: 0.169045*_height,
                      )
                    ),
                  ),   
                  SizedBox(height:0.03567*_width),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 0.0111607*_width, horizontal: 0.02*_height),
                      height:0.12014*_height,
                      width:0.763285*_width,
                      decoration: roundedContainer(color: Colors.white,radius: 20.0),
                      child:PRInfo(title:"Personal development",
                      dataNotes: prS1EPersonalDevelopment,
                      english: true,
                      dataNotesAnswersMonth1: prM2modeltest.allMonthsReports[0].personalDevelopment,
                      dataNotesAnswersMonth2: prM2modeltest.allMonthsReports[1].personalDevelopment,
                      dataNotesAnswersMonth3: prM2modeltest.allMonthsReports[2].personalDevelopment,
                      dividerHeight: 0.067*_height,
                      )
                    ),
                  ),   
                  SizedBox(height:0.03567*_width),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 0.0111607*_width, horizontal: 0.02*_height),
                      height:0.2978125*_height,
                      width:0.763285*_width,
                      decoration: roundedContainer(color: Colors.white,radius: 20.0),
                      child:PRInfo(title:"Physical development",
                      english: true,
                      dataNotes: prS1EPhysicalDevelopment,
                      dataNotesAnswersMonth1: prM2modeltest.allMonthsReports[0].physicalDevelopment,
                      dataNotesAnswersMonth2: prM2modeltest.allMonthsReports[1].physicalDevelopment,
                      dataNotesAnswersMonth3: prM2modeltest.allMonthsReports[2].physicalDevelopment,
                      dividerHeight: 0.2449375*_height,
                      )
                    ),
                  ),      

          ]),),])
    );
  }
}


