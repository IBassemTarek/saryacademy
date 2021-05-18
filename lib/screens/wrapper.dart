import 'package:flutter/material.dart';
import '../provider/loginProvider.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/screens/home/home.dart';
import 'package:saryacademy/screens/signin.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: 
    Scaffold(
      body:Consumer<LoginProvider> (
        builder: (context, loginProvider, _) {
        if ( context.read<LoginProvider>().isLogged() == false) { //TODO::null exceptions
      return SignIn();
    } else {
      return HomePage();
    }
        }  
      ),
      )          
    );
  }
}