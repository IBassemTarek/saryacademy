import 'package:cloud_firestore/cloud_firestore.dart';


import '../../../models/progressReportModel2.dart';


class PRM2DataBaseServices {
  final CollectionReference prm2 = FirebaseFirestore.instance.collection('PRM2');
  final CollectionReference prMounth1 = FirebaseFirestore.instance.collection('PRMounth1');
  final CollectionReference prMounth2 = FirebaseFirestore.instance.collection('PRMounth2');
  final CollectionReference prMounth3 = FirebaseFirestore.instance.collection('PRMounth3');
  Future deleteprm2() {
    return prm2.doc(uid).delete();
  }
  Future deleteprMounth1() {
    return prMounth1.doc(uid).delete();
  }
  Future deleteprMounth2() {
    return prMounth2.doc(uid).delete();
  }
  Future deleteprMounth3() {
    return prMounth3.doc(uid).delete();
  }
final String uid;
  PRM2DataBaseServices({this.uid}); 
   void initprMounth1({List personalDevelopment, List physicalDevelopment, List socialSkills }) async { 
    var a = await prMounth1.doc(uid).get(); 
    if (a.exists) 
    await prMounth1.doc(uid).update(
      {"personalDevelopment": personalDevelopment,
       "physicalDevelopment": physicalDevelopment,
        "socialSkills":socialSkills, 
        });
else {
      final DocumentReference documentReference = prMounth1.doc(uid);
      return await documentReference.set({
     "personalDevelopment": personalDevelopment,
       "physicalDevelopment": physicalDevelopment,
        "socialSkills":socialSkills,
      });
  }
 
  }


   void initprMounth2({List personalDevelopment, List physicalDevelopment, List socialSkills }) async { 
    var a = await prMounth2.doc(uid).get(); 
    if (a.exists) 
    await prMounth2.doc(uid).update(
      {"personalDevelopment": personalDevelopment,
       "physicalDevelopment": physicalDevelopment,
        "socialSkills":socialSkills, 
        });
else {
      final DocumentReference documentReference = prMounth2.doc(uid);
      return await documentReference.set({
     "personalDevelopment": personalDevelopment,
       "physicalDevelopment": physicalDevelopment,
        "socialSkills":socialSkills,
      });
  }
 
  }


   void initprMounth3({List personalDevelopment, List physicalDevelopment, List socialSkills }) async { 
    var a = await prMounth3.doc(uid).get(); 
    if (a.exists) 
    await prMounth3.doc(uid).update(
      {"personalDevelopment": personalDevelopment,
       "physicalDevelopment": physicalDevelopment,
        "socialSkills":socialSkills, 
        });
else {
      final DocumentReference documentReference = prMounth3.doc(uid);
      return await documentReference.set({
     "personalDevelopment": personalDevelopment,
       "physicalDevelopment": physicalDevelopment,
        "socialSkills":socialSkills,
      });
  }
 
  }



 void initprm2({String studentNameA, String studentNameE, String month1E,String month2E,String  month3E,String  month1A,String  month2A,
 String  month3A ,String pdf  }) async { 
    var a = await prm2.doc(uid).get();  
    if (a.exists) 
    await prm2.doc(uid).update(
      {"studentNameA": studentNameA,
       "studentNameE": studentNameE,
        "month1E":month1E,
       "month2E":month2E,
       "month3E":month3E,
        "month1A":month1A,
        "month2A":month2A,
        "month3A":month3A,
        "pdf":pdf, 
        });
else {
      final DocumentReference documentReference = prm2.doc(uid);
      return await documentReference.set({
     "studentNameA": studentNameA,
       "studentNameE": studentNameE,
        "month1E":month1E,
       "month2E":month2E,
       "month3E":month3E,
        "month1A":month1A,
        "month2A":month2A,
        "month3A":month3A,
        "pdf":pdf, 
      });
  }
 
  }

   Future updatepdf ({String pdf}) async {
  return await prm2.doc(uid).update(
      {  "pdf": pdf
        }).then((value) => print("pdf Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }

  Future updateprNameA ({String name}) async {
  return await prm2.doc(uid).update(
      {  "studentNameA": name
        }).then((value) => print("name Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }

  Future updateprNameE ({String name}) async {
  return await prm2.doc(uid).update(
      {  "studentNameE": name
        }).then((value) => print("name Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }


  Future updateprMounth1E ({String mounth}) async {
  return await prm2.doc(uid).update(
      {  "month1E": mounth
        }).then((value) => print("mounth1 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }

  Future updateprMounth1A ({String mounth}) async {
  return await prm2.doc(uid).update(
      {  "month1A": mounth
        }).then((value) => print("mounth1 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }

  Future updateprMounth2E ({String mounth}) async {
  return await prm2.doc(uid).update(
      {  "month2E": mounth
        }).then((value) => print("mounth1 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }

  Future updateprMounth2A ({String mounth}) async {
  return await prm2.doc(uid).update(
      {  "month2A": mounth
        }).then((value) => print("mounth1 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }

  Future updateprMounth3E ({String mounth}) async {
  return await prm2.doc(uid).update(
      {  "month3E": mounth
        }).then((value) => print("mounth1 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }

  Future updateprMounth3A ({String mounth}) async {
  return await prm2.doc(uid).update(
      {  "month3A": mounth
        }).then((value) => print("mounth1 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
 
    //convert snapshot to list
  PRM2Listmodel _prm2SnapShot(DocumentSnapshot snapshot) {
    return PRM2Listmodel(
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
    return prMounth3.doc(uid).snapshots().map(_prMounth3SnapShot);
  }

  Future updateprMounth1Social ({List listOfData}) async {
  return await prMounth1.doc(uid).update(
      {  "socialSkills": listOfData
        }).then((value) => print("mounth1 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
  Future updateprMounth2Social ({List listOfData}) async {
  return await prMounth2.doc(uid).update(
      {  "socialSkills": listOfData
        }).then((value) => print("mounth2 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
  Future updateprMounth3Social ({List listOfData}) async {
  return await prMounth3.doc(uid).update(
      {  "socialSkills": listOfData
        }).then((value) => print("mounth3 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }





  Future updateprMounth1Personal ({List listOfData}) async {
  return await prMounth1.doc(uid).update(
      {  "personalDevelopment": listOfData
        }).then((value) => print("mounth1 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
  Future updateprMounth2Personal ({List listOfData}) async {
  return await prMounth2.doc(uid).update(
      {  "personalDevelopment": listOfData
        }).then((value) => print("mounth2 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
  Future updateprMounth3Personal ({List listOfData}) async {
  return await prMounth3.doc(uid).update(
      {  "personalDevelopment": listOfData
        }).then((value) => print("mounth3 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }



  Future updateprMounth1Physical ({List listOfData}) async {
  return await prMounth1.doc(uid).update(
      {  "physicalDevelopment": listOfData
        }).then((value) => print("mounth1 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
  Future updateprMounth2Physical ({List listOfData}) async {
  return await prMounth2.doc(uid).update(
      {  "physicalDevelopment": listOfData
        }).then((value) => print("mounth2 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
  Future updateprMounth3Physical ({List listOfData}) async {
  return await prMounth3.doc(uid).update(
      {  "physicalDevelopment": listOfData
        }).then((value) => print("mounth3 Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
  }