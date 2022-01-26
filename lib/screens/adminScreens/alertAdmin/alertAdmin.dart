import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/shared/adminAlert.dart';

import '../../../models/alertModel.dart';
import '../../../shared/backArrowBotton.dart';
import '../../../shared/alertchecker.dart';
import '../../../const.dart';

class AlertAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final alerts = Provider.of<List<AlertModel>>(context);
    if (alerts.isEmpty)
      return Container();
    else {
      alerts.sort((a, b) => a.dateTime.compareTo(b.dateTime));
      alertcheck(context: context);
      return Scaffold(
          appBar: AppBar(
            leading: BackArrowBotton(),
            centerTitle: true,
            titleSpacing: 0,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: LocaleText("Alerts",
                style: Theme.of(context).textTheme.headline1.copyWith(
                    color: kbackgroundColor.withOpacity(1), fontSize: 36)),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: 0.068 * _width, vertical: 0.0223 * _height),
            child: ListView.separated(
                itemCount: alerts.length,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 0.03857 * _height),
                itemBuilder: (context, i) {
                  return SingleAlertWidget(
                    alert: alerts[i],
                  );
                }),
          ));
    }
  }
}

class SingleAlertWidget extends StatelessWidget {
  final AlertModel alert;
  SingleAlertWidget({this.alert});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 0.7198 * _width,
            height: 0.029 * _height,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 0.038 * _width),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: kText1Color.withOpacity(1),
            ),
            child: Text(
              alert.day.toString() +
                  "-" +
                  alert.month.toString() +
                  "-" +
                  alert.year.toString(),
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
        SizedBox(height: 0.01657 * _height),
        Row(children: [
          Container(
            width: 0.7898 * _width,
            padding: EdgeInsets.symmetric(
                vertical: 0.006 * _height, horizontal: 0.038 * _width),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: kGreyColor.withOpacity(1))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      alert.name + "'s parent says ",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: kGradColor2.withOpacity(1), fontSize: 12),
                    ),
                    SizedBox(
                      height: 0.006 * _height,
                    ),
                    Text(
                      "'${alert.parentMessId}'",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: kText1Color.withOpacity(1), fontSize: 12),
                    ),
                  ],
                ),
                alert.teacherMessId.isNotEmpty
                    ? Icon(
                        Icons.done_all,
                        size: 0.05 * _width,
                        color: kbackgroundColor2.withOpacity(1),
                      )
                    : Container(),
              ],
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              List<String> avalibleAnswers;
              if (alert.parentMessId == 'want to talk with you')
                avalibleAnswers = adminAlertsEQ1;
              else if (alert.parentMessId == "Can you send me some photos?")
                avalibleAnswers = adminAlertsEQ2;
              else if (alert.parentMessId == "Is my child doing well?")
                avalibleAnswers = adminAlertsEQ3;
              if (alert.parentMessId == 'اريد التحدث معك')
                avalibleAnswers = adminAlertsAQ1;
              else if (alert.parentMessId == "يمكنك أن ترسل لي بعض الصور؟")
                avalibleAnswers = adminAlertsAQ2;
              else if (alert.parentMessId == "هل طفلي بخير؟")
                avalibleAnswers = adminAlertsAQ3;
              showDialog(
                context: context,
                builder: (BuildContext context) =>
                    adminBuildPopupDialog(context, avalibleAnswers, alert.uid),
              );
            },
            child: Icon(
              Icons.reply,
              size: 0.05 * _width,
              color: kbackgroundColor2.withOpacity(1),
            ),
          )
        ])
      ],
    );
  }
}
