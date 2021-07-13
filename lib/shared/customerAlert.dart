import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/profileInfoModels/childInfoModel.dart';
import 'package:saryacademy/models/user.dart';
import 'package:saryacademy/services/adminServices/adminAlertDatbase.dart';

import '../const.dart';

Widget buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: Center(
      child: LocaleText('Alert',style:TextStyle(
                fontFamily: "arialRounded",
                fontSize: 34,
                color: Color(0xff041056),
              ),),
    ),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Center(child: LocaleText("AlertContent",style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText3Color.withOpacity(1),fontSize: 15)))),
      ],
    ),
    actions: <Widget>[
      new InkWell(
        onTap: () {
          AdminAlertDataBaseServices().updateAlertData(
            dateTime: Timestamp.fromDate(DateTime.now()),
            day: DateTime.now().day,
            month: DateTime.now().month,
            name: Provider.of<ChildInfoModel>(context,listen: false).name,
            showed: false,
            uid: Provider.of<UserModel>(context,listen: false).id,
            year: DateTime.now().year,
          );
          Navigator.of(context).pop();
        },
        child: Container(
          padding: EdgeInsets.all(10),
          child: const LocaleText("Yes",style: TextStyle(
              fontFamily: "arialRounded",
              fontSize: 16,
              color: Color(0xff1C9CD8),
            ),)),
      ),
      new InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          padding: EdgeInsets.all(10),
          child: const LocaleText("May be later",style: TextStyle(
              fontFamily: "arialRounded",
              fontSize: 16,
              color: Color(0xff1C9CD8),
            ))),
      ),
    ],
  );
}