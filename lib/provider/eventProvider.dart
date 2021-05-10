import 'package:flutter/material.dart';
import 'package:saryacademy/models/eventModel.dart';

class ProfileProvider with ChangeNotifier {
   
  List<EventModel> _ourEvents;

  //getter
  List<EventModel> get upCommingEvents {
    return [..._ourEvents];
  }

  void addEvent (EventModel event) {
    _ourEvents.add(event);
    notifyListeners();
  }
}