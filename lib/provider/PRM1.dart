import 'package:flutter/material.dart';
import 'package:saryacademy/models/progressReportModel1.dart';

class ProfileProvider with ChangeNotifier {
   
  PRM1model _childPR;

  //getter
  PRM1model get childPRGetter {
    return _childPR;
  }



  void addGallery ( {  String  childName,String  date,bool  presence,int  mood, List<String>  naps,bool  mealsBreakfast,
                       bool  mealslunch,   bool  fluidLiquid, bool  fluidBottle, 
                       List<String>  diaper, bool  restroomPotty, bool restroomToilet, List<bool>  clothes, 
                       List<String> activities, List<String>  notes}) 
    {
    _childPR.childName=childName;
    _childPR.date=date;
    _childPR.presence=presence;
    _childPR.mood=mood;
    _childPR.naps=naps;
    _childPR.mealsBreakfast=mealsBreakfast;
    _childPR.mealslunch=mealslunch;
    _childPR.fluidLiquid=fluidLiquid;
    _childPR.fluidBottle=fluidBottle;
    _childPR.diaper=diaper;
    _childPR.restroomPotty=restroomPotty;
    _childPR.restroomToilet=restroomToilet;
    _childPR.clothes=clothes;
    _childPR.activities=activities;
    _childPR.notes=notes;
    notifyListeners();
  }
}