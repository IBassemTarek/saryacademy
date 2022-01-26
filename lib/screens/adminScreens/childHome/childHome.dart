import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/galleryItemsList.dart';
import 'package:saryacademy/screens/adminScreens/PRS3/adminPRS3.dart';

import '../../../models/profileInfoModels/childInfoModel.dart';
import '../../../screens/adminScreens/PRS1/adminPRS1.dart';

import '../../../screens/adminScreens/adminToddlerReport/adminToddlerReport.dart';
import '../../../screens/adminScreens/alertAdmin/alertAdmin.dart';
import '../../../screens/adminScreens/childEvents/childEvents.dart';
import '../../../screens/adminScreens/childGallery/childGallery.dart';
import '../../../screens/adminScreens/childprofile/childProfile.dart';
import '../../../shared/alertchecker.dart';
import '../../../shared/loading.dart';
import '../../../shared/pageRouteAnimation.dart';
import '../PRS2/adminPRS2.dart';
import '../../../const.dart';

class AdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    alertcheck(context: context);
    return Scaffold(
      backgroundColor: kbackgroundColor.withOpacity(1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CatDataCard(
                cardName: "Profile",
                ontap: () {
                  Navigator.push(
                    context,
                    OnBoardingPageRoute(
                        duration: 600,
                        widget: ChildProfile(),
                        myAnimation: Curves.easeInOut),
                  );
                }),
            Consumer<ChildInfoModel>(builder: (context, childInfo, _) {
              if (childInfo.reportType == 1) {
                return CatDataCard(
                    cardName: "Toddler Report",
                    ontap: () {
                      Navigator.push(
                        context,
                        OnBoardingPageRoute(
                            duration: 600,
                            widget: AdminToddlerReport(),
                            myAnimation: Curves.easeInOut),
                      );
                    });
              } else if (childInfo.reportType == 2) {
                return CatDataCard(
                    cardName: "Preschool S1",
                    ontap: () {
                      Navigator.push(
                        context,
                        OnBoardingPageRoute(
                            duration: 600,
                            widget: AdminPRS1(),
                            myAnimation: Curves.easeInOut),
                      );
                    });
              } else if (childInfo.reportType == 3) {
                return CatDataCard(
                    cardName: "Preschool S2",
                    ontap: () {
                      Navigator.push(
                        context,
                        OnBoardingPageRoute(
                            duration: 600,
                            widget: AdminPRS2(),
                            myAnimation: Curves.easeInOut),
                      );
                    });
              } else if (childInfo.reportType == 4) {
                return CatDataCard(
                    cardName: "Preschool S3",
                    ontap: () {
                      Navigator.push(
                        context,
                        OnBoardingPageRoute(
                            duration: 600,
                            widget: AdminPRS3(),
                            myAnimation: Curves.easeInOut),
                      );
                    });
              } else
                return Container(
                  height: 0.0948 * _height,
                  width: 0.9034 * _width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Loading(),
                );
            }),
            CatDataCard(
                cardName: "Events",
                ontap: () {
                  Navigator.push(
                    context,
                    OnBoardingPageRoute(
                        duration: 600,
                        widget: ChildEvents(),
                        myAnimation: Curves.easeInOut),
                  );
                }),
            CatDataCard(
                cardName: "Gallery",
                ontap: () {
                  Navigator.push(
                    context,
                    OnBoardingPageRoute(
                        duration: 600,
                        widget: ChangeNotifierProvider(
                            create: (context) => GalleryItemsList(),
                            child: ChildGalleries()),
                        myAnimation: Curves.easeInOut),
                  );
                }),
            CatDataCard(
                cardName: "Alerts",
                ontap: () {
                  Navigator.push(
                    context,
                    OnBoardingPageRoute(
                        duration: 600,
                        widget: AlertAdmin(),
                        myAnimation: Curves.easeInOut),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class CatDataCard extends StatelessWidget {
  final String cardName;
  final Function ontap;
  CatDataCard({this.cardName, this.ontap});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Center(
      child: InkWell(
        onTap: ontap,
        child: Container(
          height: 0.0948 * _height,
          width: 0.9034 * _width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LocaleText(cardName,
                  style: Theme.of(context).textTheme.headline1.copyWith(
                      color: kbackgroundColor.withOpacity(1), fontSize: 34)),
              Icon(Icons.arrow_forward_ios,
                  size: 26, color: kText1Color.withOpacity(1)),
            ],
          ),
        ),
      ),
    );
  }
}
