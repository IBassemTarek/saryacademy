import 'package:cloud_firestore/cloud_firestore.dart';

class EventCard {
  final String  imageURL;
  final String  id;
  final String  title;
  final String  text;
  final Timestamp  date;
  EventCard({this.date,this.imageURL,this.text,this.title, this.id});
}

class EventModel {
  final List<EventCard> eventsCards;
  EventModel({this.eventsCards});
}