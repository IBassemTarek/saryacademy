import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:saryacademy/screens/signIn/signin.dart';
import 'package:saryacademy/services/auth.dart';

import '../const.dart';
import 'pageRouteAnimation.dart';

class SignOut extends StatelessWidget {
  final _auth=AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10) ),
                    color:  kText1Color.withOpacity(1)
                    ),
      child: InkWell(
        onTap: () async {
          await _auth.signOut();
          Navigator.push(
          context,
          OnBoardingPageRoute(
          duration: 1000,
          widget: SignIn(),
          myAnimation: Curves.elasticInOut),
           );
        },
        child: LocaleText("sign out",style:Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.white,fontSize: 14))),
      );
  }
}