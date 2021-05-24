class EventCard {
  final String  imageURL;
  final String  title;
  final String  text;
  final String  date;
  final bool  nextEvent;
  final int order;
  EventCard({this.order,this.date,this.imageURL,this.text,this.title,this.nextEvent});
}

class EventModel {
  final List<EventCard> eventsCards;
  EventModel({this.eventsCards});
}