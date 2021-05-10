import 'package:flutter/material.dart';
import 'package:saryacademy/models/progressReportModel3.dart';

class ProfileProvider with ChangeNotifier {
   
  PRM3model _childPR;

  //getter
  PRM3model get childPRGetter {
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