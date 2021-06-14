import 'package:cloud_firestore/cloud_firestore.dart'; 
import 'package:saryacademy/models/alertModel.dart';

class AdminAlertDataBaseServices {
  final CollectionReference alerts = FirebaseFirestore.instance.collection('alert');


 
    //convert snapshot to list
  List<AlertModel> _alertsListSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return AlertModel(
        dateTime: doc.get("dateTime"),
          name: doc.get("name"),
          day: doc.get("day"),
          month: doc.get("month"),
          year: doc.get("year"),
          showed: doc.get("showed"),
          uid: doc.get("uid"),
          ); 
    }).toList();
  }

  // define a stream of data that give response when user login or logout
  Stream<List<AlertModel>> get alertsCardsData {
    return alerts.snapshots().map(_alertsListSnapShot);
  } 

Future<void> deleteAlertsOfUser(String id) {
  return alerts.doc(id)  
    .delete()
    .then((value) => print("Alerts Deleted"))
    .catchError((error) => print("Failed to delete Alerts: $error"));
}


  Future updateAlertData(
      {String name, int day, int year, int month, bool showed, String uid,Timestamp dateTime}) async {


var a = await  alerts.doc(uid).get();

if (a.exists) {
    return await alerts.doc(uid).update({
      "dateTime":dateTime,
      "name": name,
      "day": day,
      "month": month,
      "year": year,
      "showed": showed,
      "uid": uid,
    });
    } else {
      final DocumentReference documentReference = alerts.doc(uid);
      return await documentReference.set({
      "dateTime":dateTime,
      "name": name,
      "day": day,
      "month": month,
      "year": year,
      "showed": showed,
      "uid": uid,
      });
  }}

  Future toggleAlertState(
      { bool showed , String uid }) async {
   await alerts.doc(uid).update({
      "showed": showed,
    });
  }
  }