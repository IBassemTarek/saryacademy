import 'package:flutter/material.dart';
import 'package:saryacademy/models/progressReportModel2.dart';

class ProfileProvider with ChangeNotifier {
   
  PRM2model _childPR;

  //getter
  PRM2model get childPRGetter {
    return _childPR;
  }


  void addGallery ( {  List<int>  socialSkills,List<int>  personalDevelopment,List<int>  physicalDevelopment}) 
    {
    _childPR.socialSkills=socialSkills;
    _childPR.personalDevelopment=personalDevelopment;
    _childPR.physicalDevelopment=physicalDevelopment;
    notifyListeners();
  }
}