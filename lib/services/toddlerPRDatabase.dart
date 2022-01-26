import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/progressReportModel1.dart';

class ToddlerPRDataBaseServices {
  final CollectionReference toddlerPR =
      FirebaseFirestore.instance.collection('toddlerPR');

  Future deletetoddlerPR() {
    return toddlerPR.doc(uid).delete();
  }

  final String uid;
  ToddlerPRDataBaseServices({this.uid});

  void initToddlerReport({
    String childName,
    String dateE,
    String dateA,
    bool presence,
    String pdf,
    List naps,
    int mood,
    int meals,
    int diaperTimes,
    int diaper,
    bool playoutside,
    List naps2,
    List clothes,
    List activities,
    List notes,
  }) async {
    var a = await toddlerPR.doc(uid).get();

    if (a.exists)
      await toddlerPR.doc(uid).update({
        "childName": childName,
        "dateE": dateE,
        "dateA": dateA,
        "presence": presence,
        "mood": mood,
        "pdf": pdf,
        "diaperTimes": diaperTimes,
        "naps": naps,
        "meals": meals,
        "playoutside": playoutside,
        "naps2": naps2,
        "diaper": diaper,
        "clothes": clothes,
        "activities": activities,
        "notes": notes,
      });
    else {
      final DocumentReference documentReference = toddlerPR.doc(uid);
      return await documentReference.set({
        "childName": childName,
        "dateE": dateE,
        "dateA": dateA,
        "presence": presence,
        "mood": mood,
        "pdf": pdf,
        "diaperTimes": diaperTimes,
        "naps": naps,
        "meals": meals,
        "playoutside": playoutside,
        "naps2": naps2,
        "diaper": diaper,
        "clothes": clothes,
        "activities": activities,
        "notes": notes,
      });
    }
  }

  //convert snapshot to list
  PRM1model _toddlerPRSnapShot(DocumentSnapshot snapshot) {
    return PRM1model(
      diaperTimes: snapshot.get("diaperTimes"),
      childName: snapshot.get("childName"),
      dateA: snapshot.get("dateA"),
      dateE: snapshot.get("dateE"),
      presence: snapshot.get("presence"),
      mood: snapshot.get("mood"),
      pdf: snapshot.get("pdf"),
      naps: snapshot.get("naps"),
      meals: snapshot.get("meals"),
      playoutside: snapshot.get("playoutside"),
      naps2: snapshot.get("naps2"),
      diaper: snapshot.get("diaper"),
      clothes: snapshot.get("clothes"),
      notes: snapshot.get("notes"),
      activities: snapshot.get("activities"),
    );
  }

  // define a stream of data that give response when user login or logout
  Stream<PRM1model> get toddlerPRCardData {
    return toddlerPR.doc(uid).snapshots().map(_toddlerPRSnapShot);
  }

  Future updateDate({String dateE, String dateA, String uid}) async {
    return await toddlerPR.doc(uid).update({
      "dateA": dateA,
      "dateE": dateE,
    });
  }

  Future updateprNameE({String name}) async {
    return await toddlerPR.doc(uid).update({"childName": name});
  }

  Future updatePresence({bool presence, String uid}) async {
    return await toddlerPR.doc(uid).update({
      "presence": presence,
    });
  }

  Future updateplayoutside({bool playoutside, String uid}) async {
    return await toddlerPR.doc(uid).update({
      "playoutside": playoutside,
    });
  }

  Future updateMood({int mood, String uid}) async {
    return await toddlerPR.doc(uid).update({
      "mood": mood,
    });
  }

  Future updateMeals({int meal, String uid}) async {
    return await toddlerPR.doc(uid).update({
      "meals": meal,
    });
  }

  Future updateDiaper({int diaper, String uid}) async {
    return await toddlerPR.doc(uid).update({
      "diaper": diaper,
    });
  }

  Future updateDiaperTimes({int diaperTimes, String uid}) async {
    return await toddlerPR.doc(uid).update({
      "diaperTimes": diaperTimes,
    });
  }

  Future updateListText({String title, List list, String uid}) async {
    if (title == "Nap")
      return await toddlerPR.doc(uid).update({
        "naps": list,
      });
    else if (title == "Clothes")
      return await toddlerPR.doc(uid).update({
        "clothes": list,
      });
    else if (title == "Nap2")
      return await toddlerPR.doc(uid).update({
        "naps2": list,
      });
  }

  Future updateNotesAndActivities({String title, List list, String uid}) async {
    if (title == "Activities")
      return await toddlerPR.doc(uid).update({
        "activities": list,
      });
    else if (title == "Notes")
      return await toddlerPR.doc(uid).update({
        "notes": list,
      });
  }

  Future updatePDF({String pdf, String uid}) async {
    return await toddlerPR.doc(uid).update({
      "pdf": pdf,
    });
  }
}
