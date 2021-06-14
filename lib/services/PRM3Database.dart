import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saryacademy/models/progressReportModel3.dart';


class PRM3DataBaseServices {
  final CollectionReference prm3 = FirebaseFirestore.instance.collection('PRM3');
  final CollectionReference pr2Mounth1 = FirebaseFirestore.instance.collection('PR2Mounth1');
  final CollectionReference pr2Mounth2 = FirebaseFirestore.instance.collection('PR2Mounth2');
  final CollectionReference pr2Mounth3 = FirebaseFirestore.instance.collection('PR2Mounth3');

final String uid;
  PRM3DataBaseServices({this.uid});

 void initPRM3() async {
    await prm3.doc(uid).get();
    await pr2Mounth1.doc(uid).get();
    await pr2Mounth2.doc(uid).get();
    await pr2Mounth3.doc(uid).get();
  }
  Future updateprMounth1E ({String mounth}) async {
  return await prm3.doc(uid).update(
      {  "month1E": mounth
        }).then((value) => print("mounth1 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }

  Future updateprMounth1A ({String mounth}) async {
  return await prm3.doc(uid).update(
      {  "month1A": mounth
        }).then((value) => print("mounth1 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }

  Future updateprMounth2E ({String mounth}) async {
  return await prm3.doc(uid).update(
      {  "month2E": mounth
        }).then((value) => print("mounth1 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }

  Future updateprMounth2A ({String mounth}) async {
  return await prm3.doc(uid).update(
      {  "month2A": mounth
        }).then((value) => print("mounth1 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }

  Future updateprMounth3E ({String mounth}) async {
  return await prm3.doc(uid).update(
      {  "month3E": mounth
        }).then((value) => print("mounth1 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }

  Future updateprMounth3A ({String mounth}) async {
  return await prm3.doc(uid).update(
      {  "month3A": mounth
        }).then((value) => print("mounth1 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
  Future updateprNameA ({String name}) async {
  return await prm3.doc(uid).update(
      {  "studentNameA": name
        }).then((value) => print("name Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }

  Future updateprNameE ({String name}) async {
  return await prm3.doc(uid).update(
      {  "studentNameE": name
        }).then((value) => print("name Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }


   Future updatepdf ({String pdf}) async {
  return await prm3.doc(uid).update(
      {  "pdf": pdf
        }).then((value) => print("pdf Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
    //convert snapshot to list
  PRM3Listmodel _prm3SnapShot(DocumentSnapshot snapshot) {
    return PRM3Listmodel(
        month1A: snapshot.get("month1A"),
        month1E: snapshot.get("month1E"),
        month2A: snapshot.get("month2A"),
        month2E: snapshot.get("month2E"),
        month3E: snapshot.get("month3E"),
        month3A: snapshot.get("month3A"),
        pdf: snapshot.get("pdf"),
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
    return pr2Mounth3.doc(uid).snapshots().map(_pr3Mounth3SnapShot);
  } 

  Future updateprMounth1Social ({List listOfData}) async {
  return await pr2Mounth1.doc(uid).update(
      {  "socialSkills": listOfData
        }).then((value) => print("mounth1 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
  Future updateprMounth2Social ({List listOfData}) async {
  return await pr2Mounth2.doc(uid).update(
      {  "socialSkills": listOfData
        }).then((value) => print("mounth2 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
  Future updateprMounth3Social ({List listOfData}) async {
  return await pr2Mounth3.doc(uid).update(
      {  "socialSkills": listOfData
        }).then((value) => print("mounth3 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }





  Future updateprMounth1Personal ({List listOfData}) async {
  return await pr2Mounth1.doc(uid).update(
      {  "personalDevelopment": listOfData
        }).then((value) => print("mounth1 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
  Future updateprMounth2Personal ({List listOfData}) async {
  return await pr2Mounth2.doc(uid).update(
      {  "personalDevelopment": listOfData
        }).then((value) => print("mounth2 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
  Future updateprMounth3Personal ({List listOfData}) async {
  return await pr2Mounth3.doc(uid).update(
      {  "personalDevelopment": listOfData
        }).then((value) => print("mounth3 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }



  Future updateprMounth1Physical ({List listOfData}) async {
  return await pr2Mounth1.doc(uid).update(
      {  "physicalDevelopment": listOfData
        }).then((value) => print("mounth1 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
  Future updateprMounth2Physical ({List listOfData}) async {
  return await pr2Mounth2.doc(uid).update(
      {  "physicalDevelopment": listOfData
        }).then((value) => print("mounth2 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
  Future updateprMounth3Physical ({List listOfData}) async {
  return await pr2Mounth3.doc(uid).update(
      {  "physicalDevelopment": listOfData
        }).then((value) => print("mounth3 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
  }