import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/profileInfoModels/childInfoModel.dart';
import 'package:saryacademy/screens/PRS1/PRS1A.dart';
import 'package:saryacademy/screens/PRS1/PRS1E.dart';
import 'package:saryacademy/screens/PRS2/PRS2A.dart';
import 'package:saryacademy/screens/PRS2/PRS2E.dart';
import 'package:saryacademy/screens/ToddlerReport/ToddlerReportE.dart';
import 'package:saryacademy/screens/ToddlerReport/toddlerReportA.dart';
import 'package:saryacademy/screens/events/event.dart';
import 'package:saryacademy/screens/gallery/gallery.dart';
import 'package:saryacademy/screens/profile.dart';
import 'package:saryacademy/shared/pageRouteAnimation.dart';

import '../const.dart';
import 'customerAlert.dart';

class BottomBar extends StatelessWidget {
  final String widgetName;
  BottomBar({this.widgetName});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final childInfo = Provider.of<ChildInfoModel>(context);
    return Container(
        height: 0.07152*_height,
        width: _width,
        color: kbackgroundColor.withOpacity(1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconBotton(
              icon: Icons.phone_in_talk,
              ontap: (){
              showDialog(
              context: context,
              builder: (BuildContext context) => buildPopupDialog(context),
            );
              },
              ),
            IconBotton(
              icon: Icons.summarize, 
              ontap:(){
        if (widgetName!="PRS1E" && widgetName!="PRS1A" && widgetName!="PRS2A" && widgetName!="PRS2E" && widgetName!="ToddlerReportA" && widgetName!="ToddlerReportE")
        {
        Navigator.of(context).pop(); 
                      if (childInfo.reportType == 1 && Locales.currentLocale(context).toString() == "en")
                        Navigator.push(
                          context,
                          OnBoardingPageRoute(
                              duration: 600,
                              widget: ToddlerReportE(),
                              myAnimation: Curves.easeInOut),
                        );
                      else if (childInfo.reportType == 2&& Locales.currentLocale(context).toString() == "en")
                        Navigator.push(
                          context,
                          OnBoardingPageRoute(
                              duration: 600,
                              widget: PRS1E(),
                              myAnimation: Curves.easeInOut),
                        );
                      else if (childInfo.reportType == 3&& Locales.currentLocale(context).toString() == "en")
                        Navigator.push(
                          context,
                          OnBoardingPageRoute(
                              duration: 600,
                              widget: PRS2E(),
                              myAnimation: Curves.easeInOut),
                        );

                      if (childInfo.reportType == 1 && Locales.currentLocale(context).toString() == "ar")
                        Navigator.push(
                          context,
                          OnBoardingPageRoute(
                              duration: 600,
                              widget: ToddlerReportA(),
                              myAnimation: Curves.easeInOut),
                        );
                      else if (childInfo.reportType == 2&& Locales.currentLocale(context).toString() == "ar")
                        Navigator.push(
                          context,
                          OnBoardingPageRoute(
                              duration: 600,
                              widget: PRS1A(),
                              myAnimation: Curves.easeInOut),
                        );
                      else if (childInfo.reportType == 3&& Locales.currentLocale(context).toString() == "ar")
                        Navigator.push(
                          context,
                          OnBoardingPageRoute(
                              duration: 600,
                              widget: PRS2A(),
                              myAnimation: Curves.easeInOut),
                        );
                    
        }
              }
              ),
            IconBotton(
              icon: Icons.account_circle, 
              ontap:(){
        if (widgetName!="Profile"){
        Navigator.of(context).pop();
        Navigator.push(
        context,
        OnBoardingPageRoute(
        duration: 600,
        widget: Profile(),
        myAnimation: Curves.easeInOut),
        );
        }
              }
              ),
            IconBotton(
              icon: Icons.collections,
              ontap:(){
        if (widgetName!="Gallery"){
        Navigator.of(context).pop();
        Navigator.push(
        context,
        OnBoardingPageRoute(
        duration: 600,
        widget: Gallery(),
        myAnimation: Curves.easeInOut),
        );
        }

              }
              ),
            IconBotton(
              icon: Icons.calendar_today,
              ontap:(){
        if (widgetName!="EventsPage"){
        Navigator.of(context).pop();
        Navigator.push(
        context,
        OnBoardingPageRoute(
        duration: 600,
        widget: EventsPage(),
        myAnimation: Curves.easeInOut),
        );}

              }
              ),

          ],
        ),
    );
  }
}

class IconBotton extends StatelessWidget {
 
 final IconData icon;
 final Function ontap;
 IconBotton({
   this.ontap,
   this.icon
  }) ;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: ontap,
      child: Icon(
        icon,
        color: kText1Color.withOpacity(1),
        size: 0.04232*_height,
      ));
  }
}