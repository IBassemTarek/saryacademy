import 'package:flutter/material.dart';
import 'package:saryacademy/const.dart';
import 'package:saryacademy/screens/adminScreens/adminHomePage/adminHomePage.dart';
import 'package:saryacademy/shared/pageRouteAnimation.dart';


class BackArrowBottonAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child:Icon(Icons.arrow_back_ios,size: 26,color: kText1Color.withOpacity(1)),
      onTap: (){
          Navigator.push(
          context,
          OnBoardingPageRoute(
          duration: 600,
          widget: AdminHomePage(),
          myAnimation: Curves.easeInOut),);
      },
    );
  }
}