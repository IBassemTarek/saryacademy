import 'package:flutter/material.dart';
import 'package:saryacademy/models/loginModel.dart';

class LoginProvider with ChangeNotifier {
   
  LoginModel _loginData;

  //getter
  LoginModel get loginDataGetter {
    return _loginData;
  }

  bool isLogged () {
    // if (_loginData.login == null)
    //   return false;
    // else
      return _loginData.login;
  }

  void login (){
    _loginData.login=true;
    notifyListeners();
  }
  void signout (){
    _loginData.login=false;
    notifyListeners();
  }
}