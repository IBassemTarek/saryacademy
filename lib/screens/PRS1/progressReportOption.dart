
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/progressReportModel2.dart';


import '../../../models/childUID.dart';
import '../../../models/profileInfoModels/childInfoModel.dart'; 
import '../../../models/progressReportModel3.dart';
import '../../../services/PRM2Database.dart';
import '../../../services/PRM3Database.dart';

import 'gradeLable.dart';

class ProgressReportOption extends StatelessWidget { 
  final String gradeTitle;
  final Color gradeColor;
  final String title;
  final int mounthNo;  
final int index; 
  ProgressReportOption({
  this.gradeTitle,
  this.gradeColor,
  this.mounthNo,this.index,@required this.title,
 
  });
  @override
  Widget build(BuildContext context) {
    final prMounth1Data = Provider.of<PRM3Mounth1>(context);
    final prMounth2Data = Provider.of<PRM3Mounth2>(context);
    final prMounth3Data = Provider.of<PRM3Mounth3>(context);
    final pr2Mounth1Data = Provider.of<PRM2Mounth1>(context);
    final pr2Mounth2Data = Provider.of<PRM2Mounth2>(context);
    final pr2Mounth3Data = Provider.of<PRM2Mounth3>(context);
    final uid = Provider.of<ChildModel>(context).uid;
    if ( prMounth1Data.personalDevelopment == null || prMounth1Data.socialSkills == null ||
     prMounth1Data.physicalDevelopment == null || prMounth2Data.personalDevelopment == null ||
    prMounth2Data.socialSkills == null || prMounth2Data.physicalDevelopment == null || 
    prMounth3Data.personalDevelopment == null || prMounth3Data.socialSkills == null || prMounth3Data.physicalDevelopment == null  ||

     pr2Mounth1Data.personalDevelopment == null || pr2Mounth1Data.socialSkills == null ||
     pr2Mounth1Data.physicalDevelopment == null || pr2Mounth2Data.personalDevelopment == null ||
    pr2Mounth2Data.socialSkills == null || pr2Mounth2Data.physicalDevelopment == null || 
    pr2Mounth3Data.personalDevelopment == null || pr2Mounth3Data.socialSkills == null || pr2Mounth3Data.physicalDevelopment == null  )

    return Container();
    else
    return new InkWell(
        onTap: () { 
          print(title);
          switch (title){
            case"Personal development" : {
                print("Personal development");
                print(index);
                switch (gradeTitle){
                   case"Unmeasured" : {
                        lablePersonalPlacement(uid,context,0);

                  }
                  break;
                   case"Working on Skill" : {
                      lablePersonalPlacement(uid,context,2);
                  }
                  break;
                   case"Good Progress" : {
                      lablePersonalPlacement(uid,context,1);
                  }
                  break;
                   case"Not Applicable": {
                      lablePersonalPlacement(uid,context,3);
                  }
                  break;
                } 
              
            }
            break;  
            case "Physical development" : {
                print("Physical development");
                print(index);
                switch (gradeTitle){
                   case"Unmeasured" : {
                        lablePhysicalPlacement(uid,context,0);

                  }
                  break;
                   case"Working on Skill" : {
                      lablePhysicalPlacement(uid,context,2);
                  }
                  break;
                   case"Good Progress" : {
                      lablePhysicalPlacement(uid,context,1);
                  }
                  break;
                   case"Not Applicable": {
                      lablePhysicalPlacement(uid,context,3);
                  }
                  break;
                } 
            }
            break;
            case "Social skills" : {
                print("Social skills");
                print(index);
                switch (gradeTitle){
                   case"Unmeasured" : {
                        lableSocialPlacement(uid,context,0);

                  }
                  break;
                   case"Working on Skill" : {
                      lableSocialPlacement(uid,context,2);
                  }
                  break;
                   case"Good Progress" : {
                      lableSocialPlacement(uid,context,1);
                  }
                  break;
                   case"Not Applicable": {
                      lableSocialPlacement(uid,context,3);
                  }
                  break;
                } 
            }
            break;
          }
          Navigator.of(context).pop();
        },
        child: GradeLable(gradeColor: gradeColor,gradeTitle:gradeTitle ,fontSize: 12,),
      );
  }

  void lableSocialPlacement(String uid,BuildContext context,int lableColor) { 
    final prMounth1Data = Provider.of<PRM3Mounth1>(context,listen: false);
    final prMounth2Data = Provider.of<PRM3Mounth2>(context,listen: false);
    final prMounth3Data = Provider.of<PRM3Mounth3>(context,listen: false);
    final pr2Mounth1Data = Provider.of<PRM2Mounth1>(context,listen: false);
    final pr2Mounth2Data = Provider.of<PRM2Mounth2>(context,listen: false);
    final pr2Mounth3Data = Provider.of<PRM2Mounth3>(context,listen: false);
    final reportType = Provider.of<ChildInfoModel>(context,listen: false).reportType;
    print(reportType.toString() +"hello");

    if (reportType!=null && reportType<4 )
    {
                      if (mounthNo ==1)
                     {
                      (reportType==2)?pr2Mounth1Data.socialSkills[index]= lableColor:prMounth1Data.socialSkills[index]= lableColor;
                      print(prMounth1Data.socialSkills[index]);
                      (reportType==2)? PRM2DataBaseServices(uid: uid).updateprMounth1Social(
                        listOfData: pr2Mounth1Data.socialSkills 
                      ):PRM3DataBaseServices(uid: uid).updateprMounth1Social(
                        listOfData: prMounth1Data.socialSkills 
                      );
                      
                     } 
                     else if (mounthNo ==2)
                     {
                       print(false);
                      (reportType==2)?pr2Mounth2Data.socialSkills[index]= lableColor:prMounth2Data.socialSkills[index]= lableColor;
                      print(prMounth2Data.socialSkills[index]);
                      (reportType==2)?PRM2DataBaseServices(uid: uid).updateprMounth2Social(
                        listOfData: pr2Mounth2Data.socialSkills 
                      ):PRM3DataBaseServices(uid: uid).updateprMounth2Social(
                        listOfData: prMounth2Data.socialSkills 
                      );
                     } 
                     else if (mounthNo ==3)
                     {
                       print(true);
                      (reportType==2)?pr2Mounth3Data.socialSkills[index]= lableColor:prMounth3Data.socialSkills[index]= lableColor;
                      print(prMounth3Data.socialSkills[index]);
                      (reportType==2)?PRM2DataBaseServices(uid: uid).updateprMounth3Social(
                        listOfData: pr2Mounth3Data.socialSkills 
                      ):PRM3DataBaseServices(uid: uid).updateprMounth2Social(
                        listOfData: prMounth3Data.socialSkills 
                      );
                     } 
    }


  }


  void lablePhysicalPlacement(String uid,BuildContext context,int lableColor) { 
    final prMounth1Data = Provider.of<PRM3Mounth1>(context,listen: false);
    final prMounth2Data = Provider.of<PRM3Mounth2>(context,listen: false);
    final prMounth3Data = Provider.of<PRM3Mounth3>(context,listen: false);
    final pr2Mounth1Data = Provider.of<PRM2Mounth1>(context,listen: false);
    final pr2Mounth2Data = Provider.of<PRM2Mounth2>(context,listen: false);
    final pr2Mounth3Data = Provider.of<PRM2Mounth3>(context,listen: false);
    final reportType = Provider.of<ChildInfoModel>(context,listen: false).reportType;
    if (reportType!=null && reportType<4)
    {
                      if (mounthNo ==1)
                     {
                      (reportType==2)?pr2Mounth1Data.physicalDevelopment[index]= lableColor:prMounth1Data.physicalDevelopment[index]= lableColor;
                      print(prMounth1Data.physicalDevelopment[index]);
                      (reportType==2)?PRM2DataBaseServices(uid: uid).updateprMounth1Physical(
                        listOfData: pr2Mounth1Data.physicalDevelopment 
                      ):PRM3DataBaseServices(uid: uid).updateprMounth1Physical(
                        listOfData: prMounth1Data.physicalDevelopment 
                      );
                     } 
                     else if (mounthNo ==2)
                     {
                       print(false);
                      (reportType==2)?pr2Mounth2Data.physicalDevelopment[index]= lableColor:prMounth2Data.physicalDevelopment[index]= lableColor;
                      print(prMounth2Data.physicalDevelopment[index]);
                      (reportType==2)?PRM2DataBaseServices(uid: uid).updateprMounth2Physical(
                        listOfData: pr2Mounth2Data.physicalDevelopment 
                      ):PRM3DataBaseServices(uid: uid).updateprMounth2Physical(
                        listOfData: prMounth2Data.physicalDevelopment 
                      );
                     } 
                     else if (mounthNo ==3)
                     {
                       print(true);
                      (reportType==2)?pr2Mounth3Data.physicalDevelopment[index]= lableColor:prMounth3Data.physicalDevelopment[index]= lableColor;
                      print(prMounth3Data.physicalDevelopment[index]);
                      (reportType==2)?PRM2DataBaseServices(uid: uid).updateprMounth3Physical(
                        listOfData: pr2Mounth3Data.physicalDevelopment 
                      ):PRM3DataBaseServices(uid: uid).updateprMounth3Physical(
                        listOfData: prMounth3Data.physicalDevelopment 
                      );
                     }
    } 

  }


  void lablePersonalPlacement(String uid,BuildContext context,int lableColor) { 
    final prMounth1Data = Provider.of<PRM3Mounth1>(context,listen: false);
    final prMounth2Data = Provider.of<PRM3Mounth2>(context,listen: false);
    final prMounth3Data = Provider.of<PRM3Mounth3>(context,listen: false);
    final pr2Mounth1Data = Provider.of<PRM2Mounth1>(context,listen: false);
    final pr2Mounth2Data = Provider.of<PRM2Mounth2>(context,listen: false);
    final pr2Mounth3Data = Provider.of<PRM2Mounth3>(context,listen: false);
    final reportType = Provider.of<ChildInfoModel>(context,listen: false).reportType;
    if (reportType!=null && reportType<4 )
    {
                      if (mounthNo ==1)
                     {
                      (reportType==2)?pr2Mounth1Data.personalDevelopment[index]= lableColor:prMounth1Data.personalDevelopment[index]= lableColor;
                      print(prMounth1Data.personalDevelopment[index]);
                      (reportType==2)?PRM2DataBaseServices(uid: uid).updateprMounth1Personal(
                        listOfData: pr2Mounth1Data.personalDevelopment 
                      ):PRM3DataBaseServices(uid: uid).updateprMounth1Personal(
                        listOfData: prMounth1Data.personalDevelopment 
                      );
                     } 
                     else if (mounthNo ==2)
                     {
                       print(false);
                      (reportType==2)?pr2Mounth2Data.personalDevelopment[index]= lableColor:prMounth2Data.personalDevelopment[index]= lableColor;
                      print(prMounth2Data.personalDevelopment[index]);
                      (reportType==2)?PRM2DataBaseServices(uid: uid).updateprMounth2Personal(
                        listOfData: pr2Mounth2Data.personalDevelopment 
                      ):PRM3DataBaseServices(uid: uid).updateprMounth2Personal(
                        listOfData: prMounth2Data.personalDevelopment 
                      );
                     } 
                     else if (mounthNo ==3)
                     {
                       print(true);
                      (reportType==2)?pr2Mounth3Data.personalDevelopment[index]= lableColor:prMounth3Data.personalDevelopment[index]= lableColor;
                      print(prMounth3Data.personalDevelopment[index]);
                      (reportType==2)?PRM2DataBaseServices(uid: uid).updateprMounth3Personal(
                        listOfData: pr2Mounth3Data.personalDevelopment 
                      ):PRM3DataBaseServices(uid: uid).updateprMounth3Personal(
                        listOfData: prMounth3Data.personalDevelopment 
                      );
                     } 
    }
  }
}