import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';


import '../../../shared/backArrowBotton.dart';
import '../../../const.dart';

class CustomAppBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      SizedBox (
        width: _width*0.05314,
      ),
      BackArrowBotton(),
    SizedBox(
      width:0.1174396*_width,
    ),
    LocaleText("Profile",style: Theme.of(context).textTheme.headline1.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 26)),            
    ],);
  }
}