import 'package:cloud_firestore/cloud_firestore.dart';


import '../../../models/progressReportModel1.dart';


class ToddlerPRDataBaseServices {
  final CollectionReference toddlerPR = FirebaseFirestore.instance.collection('toddlerPR');

  Future deletetoddlerPR() {
    return toddlerPR.doc(uid).delete();
  }
final String uid;
  ToddlerPRDataBaseServices({this.uid});
     String  childName;
     String  dateE;
     String dateA;
     bool  presence;
     int  mood;  // 0) :)             1) :(                    2)  :|
     String pdf;
     List naps; /////////////////////////////
     List meals; //0- Breakfast 1-lunch   
     List fluid; // 0- Liquid 1- fluidBottle 
     List diaper;
     List restroom; // 0- Potty  1- Toilet
     List clothes;
     List activities;
     List notes;
  void initToddlerReport({String childName,String  dateE,String dateA, bool  presence,int  mood,String pdf,List naps,List meals,
  List fluid, List diaper, List restroom, List clothes, List activities, List notes
  }) async {
    var a = await toddlerPR.doc(uid).get(); 

    if (a.exists) 
    await toddlerPR.doc(uid).update(
      {"childName": childName,
       "dateE": dateE,
        "dateA":dateA,
       "presence":presence,
       "mood":mood,
        "pdf":pdf,
        "naps":naps,
        "meals":meals,
        "fluid":fluid,
       "diaper":diaper,
       "restroom":restroom,
        "clothes":clothes,
        "activities":activities,
        "notes":notes,
        });
else {
      final DocumentReference documentReference = toddlerPR.doc(uid);
      return await documentReference.set({
     "childName": childName,
       "dateE": dateE,
        "dateA":dateA,
       "presence":presence,
       "mood":mood,
        "pdf":pdf,
        "naps":naps,
        "meals":meals,
        "fluid":fluid,
       "diaper":diaper,
       "restroom":restroom,
        "clothes":clothes,
        "activities":activities,
        "notes":notes,
      });
  }
  }
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
        pdf: snapshot.get("pdf"),
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
  Future updateDate ({String  dateE,String  dateA, String uid}) async {
   
   return await toddlerPR.doc(uid).update(
      {"dateA": dateA, 
       "dateE": dateE,
        });
  }

  Future updateprNameE ({String name}) async {
  return await toddlerPR.doc(uid).update(
      {  "childName": name
        });
  }

  Future updatePresence({bool  presence, String uid}) async {
   
   return await toddlerPR.doc(uid).update(
      {"presence": presence, 
       
        });
  }

  Future updateMood({int  mood, String uid}) async {
   
   return await toddlerPR.doc(uid).update(
      {"mood": mood, 
       
        });
  }

  Future updateListToggled({String title , List  list, String uid}) async {
   if (title=="Meals")
   return await toddlerPR.doc(uid).update(
      {"meals": list, 
        });
   else if (title=="Fluid")
   return await toddlerPR.doc(uid).update(
      {"fluid": list, 

        });


   else if (title=="Restroom")
   return await toddlerPR.doc(uid).update(
      {"restroom": list, 

        });
  }

  Future updateListText({String title , List list, String uid}) async {
   if (title=="Nap")
   return await toddlerPR.doc(uid).update(
      {"naps": list,});
   else if (title=="Diaper")
   return await toddlerPR.doc(uid).update(
      {"diaper": list,});


   else if (title=="Clothes")
   return await toddlerPR.doc(uid).update(
      {"clothes": list,});
  }

  Future updateNotesAndActivities({String title , List list, String uid}) async {
   if (title=="Activities")
   return await toddlerPR.doc(uid).update(
      {"activities": list,});

   else if (title=="Notes")
   return await toddlerPR.doc(uid).update(
      {"notes": list,});

  }

  Future updatePDF({String pdf, String uid}) async {
   return await toddlerPR.doc(uid).update(
      {"pdf": pdf, 
        });

  }

  
  }