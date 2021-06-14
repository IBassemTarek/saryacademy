 import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import '../../../models/alertModel.dart';
import '../../../services/adminServices/adminAlertDatbase.dart';

import '../main.dart';

alertcheck ({BuildContext context}) {
  final alert = Provider.of<List<AlertModel>>(context);
alert.forEach((element) { 
  if(!element.showed)
  {
      _showNotification(subTitle: "Sary Academy Mom",title: (element.name+"'s mom need to taking for you"));
      AdminAlertDataBaseServices().toggleAlertState(
        showed: true, 
        uid: element.uid,
      );
  }

});
}



  Future _showNotification ({String title, String subTitle}) async  {
    
    const androidDetails = AndroidNotificationDetails("channel ID", "Sary Academy", "this is notification ", importance: Importance.max);
    const iosDetails = IOSNotificationDetails();
    const generalNotificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await notification.show(0, title, subTitle, generalNotificationDetails);
  }