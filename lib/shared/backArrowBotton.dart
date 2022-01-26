import 'package:flutter/material.dart';
import 'package:saryacademy/const.dart';
import 'package:saryacademy/screens/home/home.dart';
import 'package:saryacademy/shared/pageRouteAnimation.dart';

class BackArrowBotton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(Icons.arrow_back_ios,
          size: 26, color: kText1Color.withOpacity(1)),
      onTap: () {
        Navigator.pop(
          context,
          OnBoardingPageRoute(
              duration: 600, widget: HomePage(), myAnimation: Curves.easeInOut),
        );
      },
    );
  }
}