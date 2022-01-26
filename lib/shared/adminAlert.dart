import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:saryacademy/services/adminServices/adminAlertDatbase.dart';

import '../const.dart';

Widget adminBuildPopupDialog(
    BuildContext context, List<String> avalibleAnswers, String studentUid) {
  final _height = MediaQuery.of(context).size.height;
  final _width = MediaQuery.of(context).size.width;

  return new AlertDialog(
    title: Center(
      child: LocaleText(
        'Alert',
        style: TextStyle(
          fontFamily: "arialRounded",
          fontSize: 34,
          color: Color(0xff041056),
        ),
      ),
    ),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Center(
            child: LocaleText(
              "AdminAlertContent",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: kText3Color.withOpacity(1), fontSize: 15),
            ),
          ),
        ),
        SizedBox(
          height: 0.0465 * _height,
        ),
        Container(
          height: 0.12 * _height,
          width: _width,
          child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () async {
                    await AdminAlertDataBaseServices().updateTeacherMessId(
                      teacherMessId: avalibleAnswers[i],
                      uid: studentUid,
                    );
                    print('done');
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    avalibleAnswers[i],
                    style: TextStyle(
                      fontFamily: "arialRounded",
                      fontSize: 16,
                      color: Color(0xff1C9CD8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              },
              separatorBuilder: (context, i) => Divider(),
              itemCount: avalibleAnswers.length),
        ),
      ],
    ),
  );
}
