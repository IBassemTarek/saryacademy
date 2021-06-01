import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saryacademy/models/progressReportModel2.dart';


class PRM2DataBaseServices {
  final CollectionReference prm2 = FirebaseFirestore.instance.collection('PRM2');
  final CollectionReference prMounth1 = FirebaseFirestore.instance.collection('PRMounth1');
  final CollectionReference prMounth2 = FirebaseFirestore.instance.collection('PRMounth2');
  final CollectionReference prMounth3 = FirebaseFirestore.instance.collection('PRMounth3');

final String uid;
  PRM2DataBaseServices({this.uid});

 
    //convert snapshot to list
  PRM2Listmodel _prm2SnapShot(DocumentSnapshot snapshot) {
    return PRM2Listmodel(
        month1A: snapshot.get("month1A"),
        month1E: snapshot.get("month1E"),
        month2A: snapshot.get("month2A"),
        month2E: snapshot.get("month2E"),
        month3E: snapshot.get("month3E"),
        month3A: snapshot.get("month3A"),
        studentNameA: snapshot.get("studentNameA"),
        studentNameE: snapshot.get("studentNameE"),
    );
  }

  // define a stream of data that give response when user login or logout
  Stream<PRM2Listmodel> get prm2sData {
    return prm2.doc(uid).snapshots().map(_prm2SnapShot);
  }


  PRM2Mounth1 _prMounth1SnapShot(DocumentSnapshot snapshot) {
    return PRM2Mounth1(
      personalDevelopment:  snapshot.get("personalDevelopment"),
      physicalDevelopment:  snapshot.get("physicalDevelopment"),
      socialSkills:  snapshot.get("socialSkills"),
    );
  }

  // define a stream of data that give response when user login or logout
  Stream<PRM2Mounth1> get prMounth1sData {
    return prMounth1.doc(uid).snapshots().map(_prMounth1SnapShot);
  }



  PRM2Mounth2 _prMounth2SnapShot(DocumentSnapshot snapshot) {
    return PRM2Mounth2(
      personalDevelopment:  snapshot.get("personalDevelopment"),
      physicalDevelopment:  snapshot.get("physicalDevelopment"),
      socialSkills:  snapshot.get("socialSkills"),
    );
  }

  // define a stream of data that give response when user login or logout
  Stream<PRM2Mounth2> get prMounth2sData {
    return prMounth2.doc(uid).snapshots().map(_prMounth2SnapShot);
  }


  PRM2Mounth3 _prMounth3SnapShot(DocumentSnapshot snapshot) {
    return PRM2Mounth3(
      personalDevelopment:  snapshot.get("personalDevelopment"),
      physicalDevelopment:  snapshot.get("physicalDevelopment"),
      socialSkills:  snapshot.get("socialSkills"),
    );
  }

  // define a stream of data that give response when user login or logout
  Stream<PRM2Mounth3> get prMounth3sData {
    return prMounth2.doc(uid).snapshots().map(_prMounth3SnapShot);
  }
  // Future updateUserData(String name, int age, String field) async {
  //   return await profileInfo.doc(uid).set(
  //     {'name': name,
  //      'age': age,
  //       'field': field
  //       });
  // }
  }