import 'package:flutter/widgets.dart';

class ChildModel extends ChangeNotifier {
  String uid;
  changeChildID(String id) {
    uid = id;
    notifyListeners();
  }
}