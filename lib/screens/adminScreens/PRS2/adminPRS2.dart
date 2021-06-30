import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../../services/PRM3Database.dart';
import '../../../shared/alertchecker.dart';
import '../../../models/progressReportModel3.dart';
import '../../../screens/PRS1/mounthAlert.dart';
import '../../../screens/PRS1/nameAlert.dart';
import '../../../models/childUID.dart';
import '../../../screens/PRS1/gradeLable.dart';
import '../../../screens/PRS1/infoOfPR.dart'; 
import '../../../screens/adminScreens/adminToddlerReport/smallTextField.dart'; 
import '../../../shared/backArrowBotton.dart'; 
import '../../../shared/loading.dart';
import '../../../const.dart'; 

class AdminPRS2  extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final prm3ModelData = Provider.of<PRM3Listmodel>(context);
    final prMounth1Data = Provider.of<PRM3Mounth1>(context);
    final prMounth2Data = Provider.of<PRM3Mounth2>(context);
    final prMounth3Data = Provider.of<PRM3Mounth3>(context); 
    final uid = Provider.of<ChildModel>(context).uid; 
    alertcheck(context:context);
    if (prm3ModelData == null ||prm3ModelData.pdf == null || prm3ModelData.month1A == null|| prm3ModelData.month1E == null || 
    prm3ModelData.month2A == null || prm3ModelData.month2E == null || prm3ModelData.month3A == null || prm3ModelData.month3E == null ||
    prm3ModelData.studentNameA == null || prm3ModelData.studentNameE == null || prMounth1Data.personalDevelopment == null ||
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
      Container(
        width: 150,
        child: FittedBox(
                          child: Text("${prm3ModelData.studentNameE}`s Report",style: Theme.of(context).textTheme.headline1.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 10)))),
                      SizedBox(width: 5,),
                      InkWell(
                        onTap: (){
                          showDialog(
                          context: context,
                          builder: (BuildContext context) => NameAlert(reportType: 3,),
                          );
                        },
                        child: Icon(Icons.edit,size: 15,color: kbackgroundColor.withOpacity(1),)),
                    ],
                  ),
                  
                  Spacer(),
                  Column(
                    children: [
                      GradeLable(gradeColor: kGoodColor,gradeTitle:"Good Progress" ,fontSize:8),
                      GradeLable(gradeColor: kWorkingColor,gradeTitle:"Working on Skill" ,fontSize:8),
                      GradeLable(gradeColor: kNotApplicableColor,gradeTitle:"Not Applicable" ,fontSize:8),
                      GradeLable(gradeColor: kWorkingColor,gradeTitle:"Unmeasured" ,fontSize:8)
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
                          height:0.04*_height,width: 110,
                          child: SmallTextField( 
                                    lableText: "pdf", 
                                    onClick: (value){
                                      PRM3DataBaseServices(uid: uid).updatepdf(
                                        pdf: value
                                      );
                                    },
                                    maxLines: 1, 
                                  ),
                                              ),
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
                               Padding(
                                 padding:   EdgeInsets.only(left:0.06415*_width),
                                 child: Text("Month number",style: Theme.of(context).textTheme.subtitle2.copyWith( color:kText2Color.withOpacity(1),fontSize: 12)),
                               ),
                               Spacer(),
                               Container(
                                 margin: EdgeInsets.only(right:0.06*_width),
                                 width: 0.239130435*_width,
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     InkWell(
                                       onTap: (){
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) => MounthAlert(mounthNo: 1,),
                                          );
                                       },
                                       child: Text(prm3ModelData.month1E,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText2Color.withOpacity(1),fontSize: 12))),
                                     InkWell(
                                       onTap: (){
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) => MounthAlert(mounthNo: 2,),
                                          );
                                       },
                                       child: Text(prm3ModelData.month2E,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText2Color.withOpacity(1),fontSize: 12))),
                                     InkWell(
                                       onTap: (){
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) => MounthAlert(mounthNo: 3,),
                                          );
                                       },
                                       child: Text(prm3ModelData.month3E,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText2Color.withOpacity(1),fontSize: 12)))
                                   ],
                         ),
                               ),
                             ],
                           ),
                  SizedBox(height:0.0169*_width),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 0.0111607*_width, horizontal: 0.02*_height),
                      height:0.37878*_height,
                      width:0.763285*_width,
                      decoration: roundedContainer(color: Colors.white,radius: 20.0),
                      child:PRInfo(
                      title:"Social skills",
                      dataNotes: prS2ESocialSkills,
                      english: true,
                      dataNotesAnswersMonth1: prMounth1Data.socialSkills,
                      dataNotesAnswersMonth2: prMounth2Data.socialSkills,
                      dataNotesAnswersMonth3: prMounth3Data.socialSkills,
                      dividerHeight:0.325*_height,
                      )
                    ),
                  ),   
                  SizedBox(height:0.03567*_width),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 0.0111607*_width, horizontal: 0.02*_height),
                      height:0.1717*_height,
                      width:0.763285*_width,
                      decoration: roundedContainer(color: Colors.white,radius: 20.0),
                      child:PRInfo(title:"Personal development",
                      dataNotes: prS2EPersonalDevelopment,
                      english: true,
                      dataNotesAnswersMonth1: prMounth1Data.personalDevelopment,
                      dataNotesAnswersMonth2: prMounth2Data.personalDevelopment,
                      dataNotesAnswersMonth3: prMounth3Data.personalDevelopment,
                      dividerHeight: 0.120*_height,
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
                      dataNotes: prS2EPhysicalDevelopment,
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


