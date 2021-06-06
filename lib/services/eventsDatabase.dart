import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saryacademy/models/eventModel.dart';

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


  Future updateEventData({String date, String text, String  title,  String  imageURL,String id} ) async {
    return await eventCard.doc(uid).collection("ListOfEventCard").doc(id).update(
      {'imageURL': imageURL,
       'title': title,
        'text': text,
       'date': date,
       'id' : id, 
        });
  }

  Future addNewEventrData({Timestamp date, String text,String  title,  String  imageURL}) async {
    return await eventCard.doc(uid).collection("ListOfEventCard").add(
      {'imageURL': imageURL,
       'title': title,
        'text': text,
       'date': date, 
        }).then((value) => print("event added"))
    .catchError((error) => print("Failed to update user: $error"));
  }
  }