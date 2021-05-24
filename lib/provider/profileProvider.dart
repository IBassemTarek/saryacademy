import 'package:flutter/material.dart';
import 'package:saryacademy/models/profileInfoModels/childInfoModel.dart';
import 'package:saryacademy/models/profileInfoModels/parentInfoModel.dart';
import 'package:saryacademy/models/profileInfoModels/medicalHistoryModel.dart';
import 'package:saryacademy/models/profileInfoModels/vaccinationModel.dart';
import 'package:saryacademy/models/profileInfoModels/absenceModel.dart';

class ProfileProvider with ChangeNotifier {
   
   ChildInfoModel _ourChildInfo;
   ParentInfoModel _ourParentInfo;
   MedicalModel _ourMedicalHistory;
   VaccinationModel _ourVaccination;
   AbsenceModel _ourAbsence;

  //getter
  ChildInfoModel get childInfo {
    return _ourChildInfo;
  }

  ParentInfoModel get parentInfo {
    return _ourParentInfo;
  }

  MedicalModel get medicalHistoryInfo {
    return _ourMedicalHistory;
  }

  VaccinationModel get ourVaccination {
    return _ourVaccination;
  }

  AbsenceModel get ourAbsence {
    return _ourAbsence;
  }

  //setter
  void setProfileData ({ChildInfoModel childInfoRx,ParentInfoModel parentInfoRx,MedicalModel medicalHistoryRx,VaccinationModel vaccinationRx,AbsenceModel absenceRx }) {
    _ourAbsence=absenceRx;
    _ourChildInfo=childInfoRx;
    _ourMedicalHistory=medicalHistoryRx;
    _ourParentInfo=parentInfoRx;
    _ourVaccination=vaccinationRx;
    notifyListeners();
  }

}