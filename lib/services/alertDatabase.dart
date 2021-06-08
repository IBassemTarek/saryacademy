import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saryacademy/models/AlertModel.dart';

class AlertsDataBaseServices {
 final CollectionReference alerts = FirebaseFirestore.instance.collection('alert');
final String uid;
  AlertsDataBaseServices({this.uid});

  Stream<AlertModel> get alertsData {
    return alerts.doc(uid).snapshots().map(_alertSnapshot);
  }

  AlertModel _alertSnapshot(DocumentSnapshot snapshot) {
    return AlertModel(
      alert: snapshot.get("requestTime"), 
    );
  }
  Future updateAlertData({List alert }) async {
    await alerts.doc(uid).set(
      {"requestTime": alert,
        });
  }

Future<void> deleteAlert() {
  return alerts.doc(uid)
    .delete()
    .then((value) => print("Alert Deleted"))
    .catchError((error) => print("Failed to delete Alert: $error"));
}
}
