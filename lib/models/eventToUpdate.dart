

import 'package:flutter/widgets.dart';

class EventToUpdate extends ChangeNotifier {

  bool needUpdate = false;

  changeIsLoading (bool value) {
    needUpdate = value; 
    notifyListeners();
  }
}