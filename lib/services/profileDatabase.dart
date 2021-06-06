import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saryacademy/models/profileInfoModels/absenceModel.dart';
import 'package:saryacademy/models/profileInfoModels/childInfoModel.dart';
import 'package:saryacademy/models/profileInfoModels/medicalHistoryModel.dart';
import 'package:saryacademy/models/profileInfoModels/parentInfoModel.dart';
import 'package:saryacademy/models/profileInfoModels/vaccinationModel.dart';

class ProfileDataBaseServices {
  final CollectionReference absenceCard = FirebaseFirestore.instance.collection('AbsenceCard');
  final CollectionReference medicalHistoryCard = FirebaseFirestore.instance.collection('MedicalHistory');
  final CollectionReference vaccinationCard = FirebaseFirestore.instance.collection('Vaccinations');
  final CollectionReference childInfo = FirebaseFirestore.instance.collection('childInfo');
  final CollectionReference parentInfo = FirebaseFirestore.instance.collection('parentInfo');


final String uid;
  ProfileDataBaseServices({this.uid});


    //convert snapshot to list
  List<AbsenceCard> _absenceCardListSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return AbsenceCard(
          days: doc.get("days"),
          month: doc.get("month")); 
    }).toList();
  }

  // define a stream of data that give response when user login or logout
  Stream<List<AbsenceCard>> get absenceCardsData {
    return absenceCard.doc(uid).collection("ListOfAbsenceCard").snapshots().map(_absenceCardListSnapShot);
  }

  Future addNewAbsenceData({String days, String month} ) async {
    // var id = medicalHistoryCard.doc(uid).collection("ListOfEventCard").doc().id;
    return await absenceCard.doc(uid).collection("ListOfAbsenceCard").add(  
      {'days': days,
       'month': month,
        }).then((value) => print("User Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }





  Stream<ChildInfoModel> get childData {
    return childInfo.doc(uid).snapshots().map(_childDataFromSnapshot);
  }

  ChildInfoModel _childDataFromSnapshot(DocumentSnapshot snapshot) {
    return ChildInfoModel(
      uid: snapshot.get("uid"),
        age: snapshot.get("age"),
        birthday: snapshot.get("birthday"),
        email: snapshot.get("email"),
        name:snapshot.get("name"),
        nationality: snapshot.get("nationality"),
        photourl:snapshot.get("photourl"),
        gender: snapshot.get("gender"),
        reportType: snapshot.get("reportType"),
    );
  }
  Future updateUserData({String name, String age, String photourl,String gender,String  birthday,String  email,String  nationality,int  reportType ,String uid }) async {
    await childInfo.doc(uid).set(
      {"name": name,
       "age": age,
        "birthday":birthday,
       "email":email,
       "nationality":nationality,
        "photourl":photourl,
        "gender":gender,
        "reportType":reportType,
        "uid":uid
        });
  }




    // convert snapshot to list
  List<VaccinationCard> _vaccinationCardFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return VaccinationCard(
          vaccination: doc.get("vaccination"),
          date: doc.get("date")); 
    }).toList();
  }

  // define a stream of data that give response when user login or logout
  Stream<List<VaccinationCard>> get vaccinationCardData {
       return vaccinationCard.doc(uid).collection("ListOfVaccinationCard").snapshots().map(_vaccinationCardFromSnapShot);
  }

  Future addNewVaccinationData({String date, String vaccination} ) async {
    // var id = medicalHistoryCard.doc(uid).collection("ListOfEventCard").doc().id;
    return await vaccinationCard.doc(uid).collection("ListOfVaccinationCard").add(  
      {'date': date,
       'vaccination': vaccination,
        }).then((value) => print("User Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }




    // convert snapshot to list
  List<MedicalHistoryCard> _medicalHistoryCardFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return MedicalHistoryCard(
          symptom: doc.get("symptom"),
          note: doc.get("note")); 
    }).toList();
  }

  // define a stream of data that give response when user login or logout
  Stream<List<MedicalHistoryCard>> get medicalHistoryCardData {
       return medicalHistoryCard.doc(uid).collection("ListOfmedicalHistoryCard").snapshots().map(_medicalHistoryCardFromSnapShot);
  }


  Future addNewMedicalData({String symptom, String note} ) async {
    // var id = medicalHistoryCard.doc(uid).collection("ListOfEventCard").doc().id;
    return await medicalHistoryCard.doc(uid).collection("ListOfmedicalHistoryCard").add(  
      {'symptom': symptom,
       'note': note,
        }).then((value) => print("User Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }


  Stream<ParentInfoModel> get parentData {
    return parentInfo.doc(uid).snapshots().map(_parentDataFromSnapshot);
  }

  ParentInfoModel _parentDataFromSnapshot(DocumentSnapshot snapshot) {
    return ParentInfoModel(
        fatherOccup: snapshot.get("father's occupation"),
        address: snapshot.get("address"),
        matherOccup: snapshot.get("Mather's occupation"),
        phone: snapshot.get("phone"),
    );
  }

  Future updateParentData({String fatherOcc, String matherOcc, String address,String phone}) async {
  return await parentInfo.doc(uid).update(
      {"father's occupation": fatherOcc,
       "Mather's occupation": matherOcc,
        "address":address,
       "phone":phone,
        }).then((value) => print("User Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
  }