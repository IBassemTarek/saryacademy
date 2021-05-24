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
          imageURL: doc.get("imageURL"),
          text: doc.get("text"),
          date: doc.get("date"),
          nextEvent: doc.get("nextEvent"),
          title: doc.get("title"),
          order: doc.get("order")); 
    }).toList();
  }

  // define a stream of data that give response when user login or logout
  Stream<List<EventCard>> get eventCardsData {
    return eventCard.doc(uid).collection("ListOfEventCard").snapshots().map(_eventCardListSnapShot);
  }

  // Future updateUserData(String name, int age, String field) async {
  //   return await profileInfo.doc(uid).set(
  //     {'name': name,
  //      'age': age,
  //       'field': field
  //       });
  // }
  }