import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/services/PRM4Database.dart';

import '../../../models/childUID.dart';
import '../../../screens/adminScreens/adminToddlerReport/smallTextField.dart';
import '../../../screens/adminScreens/childprofile/saveBotton.dart';
import '../../../services/PRM2Database.dart';
import '../../../services/PRM3Database.dart';
import '../../../services/toddlerPRDatabase.dart';

// ignore: must_be_immutable
class NameAlert extends StatelessWidget {
  String nameA;
  String nameE;
  final int reportType;
  NameAlert({this.reportType});
  @override
  Widget build(BuildContext context) {
    final uid = Provider.of<ChildModel>(context).uid;
    return new AlertDialog(
      title: Center(
        child: LocaleText(
          'Write Child Name',
          style: TextStyle(
            fontFamily: "arialRounded",
            fontSize: 21,
            color: Color(0xff041056),
          ),
        ),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SmallTextField(
            lableText: Locales.currentLocale(context).toString() == "ar"
                ? "الإسم بالعربية"
                : "English name",
            onClick: (value) {
              nameE = value;
            },
            maxLines: 1,
          ),
          Divider(),
          SmallTextField(
            lableText: Locales.currentLocale(context).toString() == "ar"
                ? "الإسم بالإنجليزية"
                : "Arabic name",
            onClick: (value) {
              nameA = value;
            },
            maxLines: 1,
          )
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15.0, bottom: 10),
          child: SaveBotton(
            smallBotton: true,
            text: "save",
            onTap: () {
              if (nameE == null || nameA == null)
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: LocaleText("enter you Info again"),
                ));
              else {
                if (reportType == 1) {
                  print('1');
                  ToddlerPRDataBaseServices(uid: uid)
                      .updateprNameE(name: nameE);
                } else if (reportType == 2) {
                  print('2');
                  PRM2DataBaseServices(uid: uid).updateprNameA(name: nameA);
                  PRM2DataBaseServices(uid: uid).updateprNameE(name: nameE);
                } else if (reportType == 3) {
                  PRM3DataBaseServices(uid: uid).updateprNameA(name: nameA);
                  PRM3DataBaseServices(uid: uid).updateprNameE(name: nameE);
                } else if (reportType == 4) {
                  PRM4DataBaseServices(uid: uid).updateprNameA(name: nameA);
                  PRM4DataBaseServices(uid: uid).updateprNameE(name: nameE);
                }
              }
              Navigator.of(context).pop();
            },
          ),
        )
      ],
    );
  }
}
