import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/progressReportModel2.dart'; 
import 'package:saryacademy/shared/backArrowBotton.dart';
import 'package:saryacademy/shared/bottombar.dart';
import 'package:saryacademy/shared/loading.dart';

import '../../const.dart';
import 'PRS1E.dart';
import 'gradeLable.dart';
import 'infoOfPR.dart';
import 'langAndPdf.dart';

class PRS1A extends StatelessWidget {
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
      backgroundColor: kbackgroundColor.withOpacity(1),
      bottomNavigationBar: BottomBar(widgetName: 'PRS1A',),
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
                    Text("تقرير ${prm2ModelData.studentNameA}",style: Theme.of(context).textTheme.subtitle2.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 22)),
                    Spacer(),
                    Column(
                      children: [
                        GradeLable(gradeColor: kGoodColor,gradeTitle:"تقدم جيد" ,fontSize:8),
                        GradeLable(gradeColor: kWorkingColor,gradeTitle:"جاري العمل عليها" ,fontSize:8),
                        GradeLable(gradeColor: kNotApplicableColor,gradeTitle:"غير مطابق" ,fontSize:8),
                        GradeLable(gradeColor: kWorkingColor,gradeTitle:"غير مقاس" ,fontSize:8)
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
                                    child: LangAndPdf(lang: 'English',page: PRS1E(),
                                    pdfURL: prm2ModelData.pdf,
                                    pr1: true,
                                    )),
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
                                       Text(prm2ModelData.month1A,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText2Color.withOpacity(1),fontSize: 12)),
                                       Text(prm2ModelData.month2A,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText2Color.withOpacity(1),fontSize: 12)),
                                       Text(prm2ModelData.month3A,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText2Color.withOpacity(1),fontSize: 12))
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
                        height:0.222893*_height,
                        width:0.763285*_width,
                        decoration: roundedContainer(color: Colors.white,radius: 20.0),
                        child:PRInfo(title:"مهارات اجتماعية",
                        dataNotes: prS1ASocialSkills,
                        english: false,
                        dataNotesAnswersMonth1: prMounth1.socialSkills,
                        dataNotesAnswersMonth2: prMounth2.socialSkills,
                        dataNotesAnswersMonth3: prMounth3.socialSkills,
                        dividerHeight: 0.169045*_height,
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
                        height:0.12014*_height,
                        width:0.763285*_width,
                        decoration: roundedContainer(color: Colors.white,radius: 20.0),
                        child:PRInfo(title:"تطوير الذات",
                        dataNotes: prS1APersonalDevelopment,
                        english: false,
                        dataNotesAnswersMonth1: prMounth1.personalDevelopment,
                        dataNotesAnswersMonth2: prMounth2.personalDevelopment,
                        dataNotesAnswersMonth3: prMounth3.personalDevelopment,
                        dividerHeight: 0.067*_height,
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
                        dataNotes: prS1APhysicalDevelopment,
                        english: false,
                        dataNotesAnswersMonth1: prMounth1.physicalDevelopment,
                        dataNotesAnswersMonth2: prMounth2.physicalDevelopment,
                        dataNotesAnswersMonth3: prMounth3.physicalDevelopment,
                        dividerHeight: 0.2449375*_height,
                        )
                      ),
                    ),
                  ),      

          ]),),])
    );
  }
}


