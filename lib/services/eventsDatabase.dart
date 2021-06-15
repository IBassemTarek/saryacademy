import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/eventModel.dart';
import 'package:saryacademy/models/isEmpty.dart';

class EventDataBaseServices {
  final CollectionReference eventCard = FirebaseFirestore.instance.collection('EventCard');


final String uid;
  EventDataBaseServices({this.uid});

 
    //convert snapshot to list
  List<EventCard> _eventCardListSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return EventCard(
          id: doc.get("id"),
          imageURL: doc.get("imageURL"),
          text: doc.get("text"),
          date: doc.get("date"), 
          title: doc.get("title"),); 
    }).toList();
  }

  // define a stream of data that give response when user login or logout
  Stream<List<EventCard>> get eventCardsData {
    return eventCard.doc(uid).collection("ListOfEventCard").snapshots().map(_eventCardListSnapShot);
  }

  Future checkIfEmpty({BuildContext context}) async {
    final isEmpty = Provider.of<IsEmptyModel>(context);
    final snapshot =  eventCard.doc(uid).collection("ListOfEventCard").snapshots();
    bool x = await snapshot.isEmpty;
    if ( x ) {
        isEmpty.changeEventstate(true); 
        return true;
    }
    else 
    {
      isEmpty.changeEventstate(false);
      return false;
      
    }
    

  }


  void initEvents() async {
    await eventCard.doc(uid).collection("ListOfEventCard").get();
  }

  Future updateEventData({Timestamp date, String text, String  title,  String  imageURL,String id, BuildContext context} ) async {
    return await eventCard.doc(uid).collection("ListOfEventCard").doc(id).update(
      {'imageURL': imageURL,
       'title': title,
        'text': text,
       'date': date,
       'id' : id, 
        }).then((value) {
            print("event added");
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("event updated"),
                                   ));
        }).catchError((error) => print("Failed to add event: $error"));
  }

  Future addNewEventrData({Timestamp date, String text,String  title,  String  imageURL}) async {
    return await eventCard.doc(uid).collection("ListOfEventCard").doc(title).set(
      {'imageURL': imageURL,
       'title': title,
        'text': text,
       'date': date, 
       'id': title,
        }).then((value) => print("event added"))
    .catchError((error) => print("Failed to add event: $error"));
  }

Future<void> deleteEvent(String id) {
  return eventCard.doc(uid).collection("ListOfEventCard")
    .doc(id)
    .delete()
    .then((value) => print("Event Deleted"))
    .catchError((error) => print("Failed to delete event: $error"));
}
  }