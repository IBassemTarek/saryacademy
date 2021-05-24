import 'package:flutter/material.dart';
import 'package:saryacademy/models/progressReportModel3.dart';
import 'package:saryacademy/screens/PRS1/gradeLable.dart';
import 'package:saryacademy/screens/PRS1/infoOfPR.dart';
import 'package:saryacademy/screens/PRS1/langAndPdf.dart';
import 'package:saryacademy/shared/backArrowBotton.dart';

import '../../const.dart';

class PRS2A extends StatelessWidget {
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
              Directionality(
                textDirection: TextDirection.rtl,
                              child: Row(
                  children: [
                    Text("تقرير ${prM3modeltest.studentNameA}",style: Theme.of(context).textTheme.subtitle2.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 22)),
                    Spacer(),
                    Column(
                      children: [
                        GradeLable(gradeColor: kGoodColor,gradeTitle:"تقدم جيد" ,),
                        GradeLable(gradeColor: kWorkingColor,gradeTitle:"جاري العمل عليها" ,),
                        GradeLable(gradeColor: kNotApplicableColor,gradeTitle:"غير مطابق" ,),
                        GradeLable(gradeColor: kWorkingColor,gradeTitle:"غير مقاس" ,)
                      ],
                    ),

                  ],
                ),
              ), 
              SizedBox(height:0.0169*_width),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 0.4*_width,
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    width:0.3*_width,
                                    child: LangAndPdf(lang: 'English')),
                                  SizedBox(height:0.0169*_width),
                     Container(
                       height: 0.02232*_height,
                       width:0.3*_width ,
                       decoration: roundedContainer(color: kIconColor.withOpacity(1),radius: 20.0).copyWith(boxShadow: []),
                       child: Center(child: Text("Preschool Stage 2",style: Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.white,fontSize: 12))),
                       ),

                                ],
                              ),
                            ),
                          ),
                        ),
                           Directionality(
                             textDirection: TextDirection.rtl,
                              child: Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 Container(
                                   margin: EdgeInsets.only(left:0.06*_width),
                                   width: 0.239130435*_width,
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text(prM3modeltest.month1A,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText2Color.withOpacity(1),fontSize: 12)),
                                       Text(prM3modeltest.month2A,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText2Color.withOpacity(1),fontSize: 12)),
                                       Text(prM3modeltest.month3A,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText2Color.withOpacity(1),fontSize: 12))
                                     ],
                         ),
                                 ),
                               ],
                             ),
                           ),
                  SizedBox(height:0.0169*_width),
                      Directionality(
                      textDirection: TextDirection.rtl,
                        child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 0.0111607*_width, horizontal: 0.02*_height),
                      height:0.37878*_height,
                      width:0.763285*_width,
                        decoration: roundedContainer(color: Colors.white,radius: 20.0),
                        child:PRInfo(title:"مهارات اجتماعية",
                        dataNotes: prS2ASocialSkills,
                        english: false,
                        dataNotesAnswersMonth1: prM3modeltest.allMonthsReports[0].socialSkills,
                        dataNotesAnswersMonth2: prM3modeltest.allMonthsReports[1].socialSkills,
                        dataNotesAnswersMonth3: prM3modeltest.allMonthsReports[2].socialSkills,
                      dividerHeight: 0.325*_height,
                        )
                      ),
                    ),
                  ),   
                  SizedBox(height:0.03567*_width),
                      Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 0.0111607*_width, horizontal: 0.02*_height),
                      height:0.1717*_height,
                      width:0.763285*_width,
                        decoration: roundedContainer(color: Colors.white,radius: 20.0),
                        child:PRInfo(title:"تطوير الذات",
                        dataNotes: prS2APersonalDevelopment,
                        english: false,
                        dataNotesAnswersMonth1: prM3modeltest.allMonthsReports[0].personalDevelopment,
                        dataNotesAnswersMonth2: prM3modeltest.allMonthsReports[1].personalDevelopment,
                        dataNotesAnswersMonth3: prM3modeltest.allMonthsReports[2].personalDevelopment,
                      dividerHeight: 0.120*_height,
                        )
                      ),
                    ),
                  ),   
                  SizedBox(height:0.03567*_width),
                      Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 0.0111607*_width, horizontal: 0.02*_height),
                      height:0.2978125*_height,
                      width:0.763285*_width,
                        decoration: roundedContainer(color: Colors.white,radius: 20.0),
                        child:PRInfo(title:"المھارات الجسدية",
                        dataNotes: prS2APhysicalDevelopment,
                        english: false,
                        dataNotesAnswersMonth1: prM3modeltest.allMonthsReports[0].physicalDevelopment,
                        dataNotesAnswersMonth2: prM3modeltest.allMonthsReports[1].physicalDevelopment,
                        dataNotesAnswersMonth3: prM3modeltest.allMonthsReports[2].physicalDevelopment,
                      dividerHeight: 0.2449375*_height,
                        )
                      ),
                    ),
                  ),      

          ]),),])
    );
  }
}


