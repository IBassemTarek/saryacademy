import 'package:flutter/material.dart';
import 'package:saryacademy/models/profileInfoModels/profileInfoModel.dart';
import 'package:saryacademy/models/profileInfoModels/childInfoModel.dart';
import 'package:saryacademy/models/profileInfoModels/parentInfoModel.dart';
import 'package:saryacademy/models/profileInfoModels/medicalHistoryModel.dart';
import 'package:saryacademy/models/profileInfoModels/vaccinationModel.dart';
import 'package:saryacademy/models/profileInfoModels/absenceModel.dart';

class ProfileProvider with ChangeNotifier {
   
  ProfileInfo _profileData;

  //getter
  ProfileInfo get childInfo {
    return _profileData;
  }

  //setter
  void setProfileData ({ChildInfoModel childInfoRx,ParentInfoModel parentInfoRx,MedicalModel medicalHistoryRx,VaccinationModel vaccinationRx,AbsenceModel absenceRx }) {
    _profileData.ourAbsence=absenceRx;
    _profileData.ourChildInfo=childInfoRx;
    _profileData.ourMedicalHistory=medicalHistoryRx;
    _profileData.ourParentInfo=parentInfoRx;
    _profileData.ourVaccination=vaccinationRx;
    notifyListeners();
  }

}