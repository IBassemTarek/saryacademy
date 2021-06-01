import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/progressReportModel2.dart';
import 'package:saryacademy/screens/PRS1/PRS1A.dart';
import 'package:saryacademy/shared/backArrowBotton.dart';
import 'package:saryacademy/shared/bottombar.dart';
import 'package:saryacademy/shared/loading.dart';

import '../../const.dart';
import 'gradeLable.dart';
import 'infoOfPR.dart';
import 'langAndPdf.dart';

class PRS1E extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final prm2ModelData = Provider.of<PRM2Listmodel>(context);
    final prMounth1Data = Provider.of<PRM2Mounth1>(context);
    final prMounth2Data = Provider.of<PRM2Mounth2>(context);
    final prMounth3Data = Provider.of<PRM2Mounth3>(context);
    if (prm2ModelData == null || prm2ModelData.month1A == null|| prm2ModelData.month1E == null || 
    prm2ModelData.month2A == null || prm2ModelData.month2E == null || prm2ModelData.month3A == null || prm2ModelData.month3E == null ||
    prm2ModelData.studentNameA == null || prm2ModelData.studentNameE == null || prMounth1Data.personalDevelopment == null ||
    prMounth1Data.socialSkills == null || prMounth1Data.physicalDevelopment == null || prMounth2Data.personalDevelopment == null ||
    prMounth2Data.socialSkills == null || prMounth2Data.physicalDevelopment == null || prMounth3Data.personalDevelopment == null ||
    prMounth3Data.socialSkills == null || prMounth3Data.physicalDevelopment == null )
    return Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10) ),
    color: Colors.white,
    ),
    height: 0.13392857*_height,
    width: 0.90338*_width,
    child: Loading(),
    );
    else
    return Scaffold(
      bottomNavigationBar: BottomBar(widgetName: 'PRS1A',),
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
                  Text("${prm2ModelData.studentNameE}`s Report",style: Theme.of(context).textTheme.headline1.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 22)),
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
                                    child: LangAndPdf(lang: 'Arabic',page: PRS1A(),)),
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
                                     Text(prm2ModelData.month1E,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText2Color.withOpacity(1),fontSize: 12)),
                                     Text(prm2ModelData.month2E,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText2Color.withOpacity(1),fontSize: 12)),
                                     Text(prm2ModelData.month3E,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText2Color.withOpacity(1),fontSize: 12))
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
                      dataNotesAnswersMonth1: prMounth1Data.socialSkills,
                      dataNotesAnswersMonth2: prMounth2Data.socialSkills,
                      dataNotesAnswersMonth3: prMounth3Data.socialSkills,
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
                      dataNotesAnswersMonth1: prMounth1Data.personalDevelopment,
                      dataNotesAnswersMonth2: prMounth2Data.personalDevelopment,
                      dataNotesAnswersMonth3: prMounth3Data.personalDevelopment,
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
                      dataNotesAnswersMonth1: prMounth1Data.physicalDevelopment,
                      dataNotesAnswersMonth2: prMounth2Data.physicalDevelopment,
                      dataNotesAnswersMonth3: prMounth3Data.physicalDevelopment,
                      dividerHeight: 0.2449375*_height,
                      )
                    ),
                  ),      

          ]),),])
    );
  }
}


