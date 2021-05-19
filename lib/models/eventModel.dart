class EventCard {
  final String  imageURL;
  final String  title;
  final String  text;
  final String  date;
  final bool  nextEvent;
  EventCard({this.date,this.imageURL,this.text,this.title,this.nextEvent});
}

class EventModel {
  final List<EventCard> eventsCards;
  EventModel({this.eventsCards});
}

final List<EventCard> eventCardTest = [
  EventCard(
    imageURL: 'assets/images/events/event1.png',
    title: "International Fair",
    text: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. When an unknown print .....",
    date: "13 Dec 2020",
    nextEvent: true
  ),
  EventCard(
    imageURL: 'assets/images/events/event1.png',
    title: "Drawing workshop",
    text: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. When an unknown print .....",
    date: "13 Dec 2020",
    nextEvent: false
  ),
  EventCard(
    imageURL: 'assets/images/events/event1.png',
    title: "School Outings",
    text: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. When an unknown print .....",
    date: "15 Dec 2020",
    nextEvent: false
  ),
  EventCard(
    imageURL: 'assets/images/events/event1.png',
    title: "School Outings",
    text: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. When an unknown print .....",
    date: "15 Dec 2020",
    nextEvent: false
  ),
];