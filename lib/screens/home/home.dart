import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/screens/PRS1/PRS1A.dart';
import 'package:saryacademy/screens/PRS2/PRS2A.dart';
import 'package:saryacademy/screens/PRS3/PRS3A.dart';
import 'package:saryacademy/screens/PRS3/PRS3E.dart';
import 'package:saryacademy/screens/ToddlerReport/toddlerReportA.dart';
import 'package:saryacademy/shared/customerAlertChecker.dart';

import '../../../const.dart';
import '../../models/profileInfoModels/childInfoModel.dart';
import '../../screens/PRS1/PRS1E.dart';
import '../../screens/PRS2/PRS2E.dart';
import '../../screens/ToddlerReport/ToddlerReportE.dart';
import '../../screens/events/event.dart';
import '../../screens/gallery/gallery.dart';
import '../../screens/home/profileCard.dart';
import '../../screens/home/progressReportCard.dart';
import '../../shared/customerAlert.dart';
import '../../shared/loading.dart';
import '../../shared/pageRouteAnimation.dart';
import '../profile.dart';
import 'eventsCard.dart';
import 'gallerycard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    customerAlertcheck(context: context);
    return Scaffold(
      floatingActionButton: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => buildPopupDialog(context),
          );
        },
        child: Container(
          height: _height * 0.08,
          width: _width * 0.5,
          child: Stack(
            alignment: Locales.currentLocale(context).toString() == "en"
                ? Alignment.centerRight
                : Alignment.centerLeft,
            children: [
              Container(
                alignment: Alignment.center,
                height: _height / 17,
                width: _width / 2.5,
                margin: EdgeInsets.only(bottom: 0.0039 * _height),
                padding: EdgeInsets.symmetric(
                  vertical: 0.0121 * _width,
                ),
                decoration: BoxDecoration(
                  borderRadius:
                      Locales.currentLocale(context).toString() == "en"
                          ? BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30))
                          : BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              topLeft: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: LocaleText("Alert",
                    style: Locales.currentLocale(context).toString() == "en"
                        ? Theme.of(context).textTheme.headline1.copyWith(
                            color: kbackgroundColor.withOpacity(1),
                            fontSize: 32)
                        : Theme.of(context).textTheme.subtitle2.copyWith(
                            color: kbackgroundColor.withOpacity(1),
                            fontSize: 30)),
              ),
              Positioned(
                left: Locales.currentLocale(context).toString() == "en"
                    ? _width * 0.02
                    : _width * 0.3,
                child: CircleAvatar(
                    radius: 0.03625 * _height,
                    backgroundColor: kText1Color.withOpacity(1),
                    child: Icon(Icons.phone_in_talk,
                        size: 0.039 * _height, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: kbackgroundColor.withOpacity(1),
      body: Stack(
        children: [
          Positioned(
              top: _height * 0.1216517857,
              right: 0,
              child: Image.asset('assets/images/home/home1.png',
                  width: 0.094866 * _height, height: 0.094866 * _height)),
          Align(
              alignment: Alignment.centerLeft,
              child: Image.asset('assets/images/home/home2.png',
                  width: 0.27483 * _width, height: 0.2109375 * _height)),
          Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset('assets/images/home/home3.png',
                  height: 0.2 * _height)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 0.12285714 * _height,
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child:
                    Builder(builder: (BuildContext context) => ProfileCard()),
                onTap: () {
                  Navigator.push(
                    context,
                    OnBoardingPageRoute(
                        duration: 600,
                        widget: Profile(),
                        myAnimation: Curves.easeInOut),
                  );
                },
              ),
              SizedBox(
                height: 0.0391 * _height,
              ),
              Consumer<ChildInfoModel>(builder: (context, childInfo, widget) {
                if (childInfo.reportType == null)
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                    height: 0.13392857 * _height,
                    width: 0.90338 * _width,
                    child: Loading(),
                  );
                else
                  return InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: PRCard(),
                    onTap: () {
                      if (childInfo.reportType == 1 &&
                          Locales.currentLocale(context).toString() == "en")
                        Navigator.push(
                          context,
                          OnBoardingPageRoute(
                              duration: 600,
                              widget: ToddlerReportE(),
                              myAnimation: Curves.easeInOut),
                        );
                      else if (childInfo.reportType == 2 &&
                          Locales.currentLocale(context).toString() == "en")
                        Navigator.push(
                          context,
                          OnBoardingPageRoute(
                              duration: 600,
                              widget: PRS1E(),
                              myAnimation: Curves.easeInOut),
                        );
                      else if (childInfo.reportType == 3 &&
                          Locales.currentLocale(context).toString() == "en")
                        Navigator.push(
                          context,
                          OnBoardingPageRoute(
                              duration: 600,
                              widget: PRS2E(),
                              myAnimation: Curves.easeInOut),
                        );
                      else if (childInfo.reportType == 4 &&
                          Locales.currentLocale(context).toString() == "en")
                        Navigator.push(
                          context,
                          OnBoardingPageRoute(
                              duration: 600,
                              widget: PRS3E(),
                              myAnimation: Curves.easeInOut),
                        );

                      if (childInfo.reportType == 1 &&
                          Locales.currentLocale(context).toString() == "ar")
                        Navigator.push(
                          context,
                          OnBoardingPageRoute(
                              duration: 600,
                              widget: ToddlerReportA(),
                              myAnimation: Curves.easeInOut),
                        );
                      else if (childInfo.reportType == 2 &&
                          Locales.currentLocale(context).toString() == "ar")
                        Navigator.push(
                          context,
                          OnBoardingPageRoute(
                              duration: 600,
                              widget: PRS1A(),
                              myAnimation: Curves.easeInOut),
                        );
                      else if (childInfo.reportType == 3 &&
                          Locales.currentLocale(context).toString() == "ar")
                        Navigator.push(
                          context,
                          OnBoardingPageRoute(
                              duration: 600,
                              widget: PRS2A(),
                              myAnimation: Curves.easeInOut),
                        );
                      else if (childInfo.reportType == 4 &&
                          Locales.currentLocale(context).toString() == "ar")
                        Navigator.push(
                          context,
                          OnBoardingPageRoute(
                              duration: 600,
                              widget: PRS3A(),
                              myAnimation: Curves.easeInOut),
                        );
                    },
                  );
              }),
              SizedBox(
                height: 0.050732 * _height,
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: GalleryCard(
                  imageURL1: 'assets/images/home/home31.png',
                  imageURL2: 'assets/images/home/home32.png',
                  imageURL3: 'assets/images/home/home33.png',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    OnBoardingPageRoute(
                        duration: 600,
                        widget: Gallery(),
                        myAnimation: Curves.easeInOut),
                  );
                },
              ),
              SizedBox(
                height: 0.03542857 * _height,
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: EventsCard(),
                onTap: () {
                  Navigator.push(
                    context,
                    OnBoardingPageRoute(
                        duration: 600,
                        widget: EventsPage(),
                        myAnimation: Curves.easeInOut),
                  );
                },
              ),
              Align(
                alignment: Locales.currentLocale(context).toString() == "en"
                    ? Alignment.bottomLeft
                    : Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(_width / 19),
                  child: InkWell(
                      onTap: () {
                        if (Locales.currentLocale(context).toString() == "en")
                          LocaleNotifier.of(context).change("ar");
                        else
                          LocaleNotifier.of(context).change("en");
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            Locales.currentLocale(context).toString() == "ar"
                                ? "assets/images/flags/EN.png"
                                : "assets/images/flags/EG.png",
                            height: _height / 40,
                          ),
                          SizedBox(
                            width: _width / 20,
                          ),
                          LocaleText(
                            "lang",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
