import 'package:flutter/widgets.dart';

class AdminMode extends ChangeNotifier{
  bool isAdmin = false;
  changeIsAdmin() {
    isAdmin =! isAdmin;
    notifyListeners();
  }
  changeIsAdminValue(bool admin) {
    isAdmin = admin;
    notifyListeners();
  }
}