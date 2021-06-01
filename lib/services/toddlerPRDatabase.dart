import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saryacademy/models/progressReportModel1.dart';


class ToddlerPRDataBaseServices {
  final CollectionReference toddlerPR = FirebaseFirestore.instance.collection('toddlerPR');


final String uid;
  ToddlerPRDataBaseServices({this.uid});

 
  //convert snapshot to list
  PRM1model _toddlerPRSnapShot(DocumentSnapshot snapshot) {
      return PRM1model(
        childName: snapshot.get("childName"),
        clothes: snapshot.get("clothes"),
        dateA: snapshot.get("dateA"),
        dateE : snapshot.get("dateE"),
        diaper: snapshot.get("diaper"),
        fluid: snapshot.get("fluid"),
        meals: snapshot.get("meals"),
        mood: snapshot.get("mood"),
        naps: snapshot.get("naps"),
        notes: snapshot.get("notes"),
        presence: snapshot.get("presence"),
        restroom: snapshot.get("restroom"),
        activities: snapshot.get("activities")); 
  }
  // define a stream of data that give response when user login or logout
  Stream<PRM1model> get toddlerPRCardData {
    return toddlerPR.doc(uid).snapshots().map(_toddlerPRSnapShot);
  }

  // Future updateUserData(String name, int age, String field) async {
  //   return await profileInfo.doc(uid).set(
  //     {'name': name,
  //      'age': age,
  //       'field': field
  //       });
  // }
  }