import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import '../../../models/alertModel.dart';
import '../../../services/adminServices/adminAlertDatbase.dart';

import '../main.dart';

customerAlertcheck({BuildContext context}) {
  final alert = Provider.of<List<AlertModel>>(context);
  alert.forEach((element) {
    if (!element.showedP && element.teacherMessId.isNotEmpty) {
      _showNotification(
          title: "Sary Academy Admins",
          subTitle: ("Admins say '${element.teacherMessId}'"));
      AdminAlertDataBaseServices().toggleAlertStateUser(
        showedP: true,
        uid: element.uid,
      );
    }
  });
}

Future _showNotification({String title, String subTitle}) async {
  const androidDetails = AndroidNotificationDetails(
      "channel ID", "Sary Academy",
      importance: Importance.max);
  const iosDetails = IOSNotificationDetails();
  const generalNotificationDetails = NotificationDetails(
    android: androidDetails,
    iOS: iosDetails,
  );

  await notification.show(0, title, subTitle, generalNotificationDetails);
}
