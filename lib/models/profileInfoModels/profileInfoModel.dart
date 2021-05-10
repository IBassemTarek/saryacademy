import 'package:saryacademy/models/profileInfoModels/childInfoModel.dart';
import 'package:saryacademy/models/profileInfoModels/parentInfoModel.dart';
import 'package:saryacademy/models/profileInfoModels/medicalHistoryModel.dart';
import 'package:saryacademy/models/profileInfoModels/vaccinationModel.dart';
import 'package:saryacademy/models/profileInfoModels/absenceModel.dart';


class ProfileInfo {
   ChildInfoModel ourChildInfo;
   ParentInfoModel ourParentInfo;
   MedicalModel ourMedicalHistory;
   VaccinationModel ourVaccination;
   AbsenceModel ourAbsence;
  ProfileInfo({this.ourAbsence,this.ourChildInfo,this.ourMedicalHistory,this.ourParentInfo,this.ourVaccination});
}