import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:saryacademy/models/progressReportModel4.dart';

class PRM4DataBaseServices {
  final CollectionReference prm4 =
      FirebaseFirestore.instance.collection('PRM4');
  CollectionReference prGrades({@required String uid}) {
    return prm4.doc(uid).collection('ListOfDaysProgress');
  }

  final String uid;
  PRM4DataBaseServices({this.uid});

  Future deleteprm2() {
    return prm4.doc(uid).delete();
  }

  Future deleteprGrades() async {
    var snapshots = await prGrades(uid: uid).get();
    final batch = FirebaseFirestore.instance.batch();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
    return batch.commit();
  }

  void initprm4({
    String studentNameA,
    String studentNameE,
  }) async {
    var a = await prm4.doc(uid).get();
    if (a.exists)
      await prm4.doc(uid).update({
        "studentNameA": studentNameA,
        "studentNameE": studentNameE,
      });
    else {
      final DocumentReference documentReference = prm4.doc(uid);
      return await documentReference.set({
        "studentNameA": studentNameA,
        "studentNameE": studentNameE,
      });
    }
  }

  Future initprGrades({
    @required List academicSkills,
    @required List socialSkills,
    @required String pdf,
    @required List workHabits,
    @required List artSkills,
    @required List speakingSkills,
    @required List musicSkills,
    @required Timestamp date,
    dateDoc,
  }) async {
    var a = await prGrades(uid: uid).doc(dateDoc).get();
    if (a.exists)
      return await prGrades(uid: uid)
          .doc(dateDoc)
          .update({
            "pdf": pdf,
            'date': date,
            "academicSkills": academicSkills,
            "socialSkills": socialSkills,
            "workHabits": workHabits,
            "artSkills": artSkills,
            "speakingSkills": speakingSkills,
            "musicSkills": musicSkills,
          })
          .then((value) => print("pdf Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    else
      return await prGrades(uid: uid).doc(dateDoc).set({
        "pdf": pdf,
        'date': date,
        "academicSkills": academicSkills,
        "socialSkills": socialSkills,
        "workHabits": workHabits,
        "artSkills": artSkills,
        "speakingSkills": speakingSkills,
        "musicSkills": musicSkills,
      });
  }

  Future checkifContain({Timestamp date}) async {
    DateTime neededDate =
        DateTime.fromMicrosecondsSinceEpoch(date.microsecondsSinceEpoch);
    String docId = neededDate.day.toString() +
        "-" +
        neededDate.month.toString() +
        "-" +
        neededDate.year.toString();

    var a = await prGrades(uid: uid).doc(docId).get();
    return a.exists;
  }

  Future updateDatePdf({String pdf, String dateDoc}) async {
    var a = await prGrades(uid: uid).doc(dateDoc).get();
    if (a.exists)
      return await prGrades(uid: uid)
          .doc(dateDoc)
          .update({"pdf": pdf})
          .then((value) => print("pdf Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    else
      return await prGrades(uid: uid).doc(dateDoc).set({
        "pdf": pdf,
      });
  }

  Future updateAcademicSkills({List skills, String dateDoc}) async {
    var a = await prGrades(uid: uid).doc(dateDoc).get();
    if (a.exists)
      return await prGrades(uid: uid)
          .doc(dateDoc)
          .update({"academicSkills": skills})
          .then((value) => print("academicSkills Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    else
      return await prGrades(uid: uid).doc(dateDoc).set({
        "academicSkills": skills,
      });
  }

  Future updateSocialSkills({List skills, String dateDoc}) async {
    var a = await prGrades(uid: uid).doc(dateDoc).get();
    if (a.exists)
      return await prGrades(uid: uid)
          .doc(dateDoc)
          .update({"socialSkills": skills})
          .then((value) => print("socialSkills Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    else
      return await prGrades(uid: uid).doc(dateDoc).set({
        "socialSkills": skills,
      });
  }

  Future updateWorkHabits({List skills, String dateDoc}) async {
    var a = await prGrades(uid: uid).doc(dateDoc).get();
    if (a.exists)
      return await prGrades(uid: uid)
          .doc(dateDoc)
          .update({"workHabits": skills})
          .then((value) => print("workHabits Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    else
      return await prGrades(uid: uid).doc(dateDoc).set({
        "workHabits": skills,
      });
  }

  Future updateArtSkills({List skills, String dateDoc}) async {
    var a = await prGrades(uid: uid).doc(dateDoc).get();
    if (a.exists)
      return await prGrades(uid: uid)
          .doc(dateDoc)
          .update({"artSkills": skills})
          .then((value) => print("artSkills Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    else
      return await prGrades(uid: uid).doc(dateDoc).set({
        "artSkills": skills,
      });
  }

  Future updateSpeakingSkills({List skills, String dateDoc}) async {
    var a = await prGrades(uid: uid).doc(dateDoc).get();
    if (a.exists)
      return await prGrades(uid: uid)
          .doc(dateDoc)
          .update({"speakingSkills": skills})
          .then((value) => print("speakingSkills Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    else
      return await prGrades(uid: uid).doc(dateDoc).set({
        "speakingSkills": skills,
      });
  }

  Future updateMusicSkills({List skills, String dateDoc}) async {
    var a = await prGrades(uid: uid).doc(dateDoc).get();
    if (a.exists)
      return await prGrades(uid: uid)
          .doc(dateDoc)
          .update({"musicSkills": skills})
          .then((value) => print("musicSkills Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    else
      return await prGrades(uid: uid).doc(dateDoc).set({
        "musicSkills": skills,
      });
  }

  List<PR4Grades> _pr4GradesSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return PR4Grades(
        academicSkills: doc.get("academicSkills"),
        socialSkills: doc.get("socialSkills"),
        pdf: doc.get("pdf"),
        date: doc.get("date"),
        workHabits: doc.get("workHabits"),
        speakingSkills: doc.get("speakingSkills"),
        artSkills: doc.get("artSkills"),
        musicSkills: doc.get("musicSkills"),
      );
    }).toList();
  }

  // define a stream of data that give response when user login or logout
  Stream<List<PR4Grades>> get pr4Gardes {
    return prGrades(uid: uid).snapshots().map(_pr4GradesSnapShot);
  }

  Future updateprNameA({String name}) async {
    return await prm4
        .doc(uid)
        .update({"studentNameA": name})
        .then((value) => print("name Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future updateprNameE({String name}) async {
    return await prm4
        .doc(uid)
        .update({"studentNameE": name})
        .then((value) => print("name Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  //convert snapshot to list
  PRM4Listmodel _prm4SnapShot(DocumentSnapshot snapshot) {
    return PRM4Listmodel(
      studentNameA: snapshot.get("studentNameA"),
      studentNameE: snapshot.get("studentNameE"),
    );
  }

  // define a stream of data that give response when user login or logout
  Stream<PRM4Listmodel> get prm4sData {
    return prm4.doc(uid).snapshots().map(_prm4SnapShot);
  }
}
