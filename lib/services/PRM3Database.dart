import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saryacademy/models/progressReportModel3.dart';


class PRM3DataBaseServices {
  final CollectionReference prm3 = FirebaseFirestore.instance.collection('PRM3');
  final CollectionReference pr2Mounth1 = FirebaseFirestore.instance.collection('PR2Mounth1');
  final CollectionReference pr2Mounth2 = FirebaseFirestore.instance.collection('PR2Mounth2');
  final CollectionReference pr2Mounth3 = FirebaseFirestore.instance.collection('PR2Mounth3');

final String uid;
  PRM3DataBaseServices({this.uid});

 
    //convert snapshot to list
  PRM3Listmodel _prm3SnapShot(DocumentSnapshot snapshot) {
    return PRM3Listmodel(
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
  Stream<PRM3Listmodel> get prm3sData {
    return prm3.doc(uid).snapshots().map(_prm3SnapShot);
  }


  PRM3Mounth1 _pr3Mounth1SnapShot(DocumentSnapshot snapshot) {
    return PRM3Mounth1(
      personalDevelopment:  snapshot.get("personalDevelopment"),
      physicalDevelopment:  snapshot.get("physicalDevelopment"),
      socialSkills:  snapshot.get("socialSkills"),
    );
  }

  // define a stream of data that give response when user login or logout
  Stream<PRM3Mounth1> get pr3Mounth1sData {
    return pr2Mounth1.doc(uid).snapshots().map(_pr3Mounth1SnapShot);
  }



  PRM3Mounth2 _pr3Mounth2SnapShot(DocumentSnapshot snapshot) {
    return PRM3Mounth2(
      personalDevelopment:  snapshot.get("personalDevelopment"),
      physicalDevelopment:  snapshot.get("physicalDevelopment"),
      socialSkills:  snapshot.get("socialSkills"),
    );
  }

  // define a stream of data that give response when user login or logout
  Stream<PRM3Mounth2> get pr3Mounth2sData {
    return pr2Mounth2.doc(uid).snapshots().map(_pr3Mounth2SnapShot);
  }


  PRM3Mounth3 _pr3Mounth3SnapShot(DocumentSnapshot snapshot) {
    return PRM3Mounth3(
      personalDevelopment:  snapshot.get("personalDevelopment"),
      physicalDevelopment:  snapshot.get("physicalDevelopment"),
      socialSkills:  snapshot.get("socialSkills"),
    );
  }

  // define a stream of data that give response when user login or logout
  Stream<PRM3Mounth3> get pr3Mounth3sData {
    return pr2Mounth2.doc(uid).snapshots().map(_pr3Mounth3SnapShot);
  }
  // Future updateUserData(String name, int age, String field) async {
  //   return await profileInfo.doc(uid).set(
  //     {'name': name,
  //      'age': age,
  //       'field': field
  //       });
  // }
  }