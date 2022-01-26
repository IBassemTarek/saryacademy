import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/screens/PRS2/pdfViewer.dart';
import 'package:saryacademy/shared/customerAlertChecker.dart';
import 'package:saryacademy/shared/pageRouteAnimation.dart';

import '../../../models/progressReportModel1.dart';
import '../../../shared/backArrowBotton.dart';
import '../../../shared/bottombar.dart';
import '../../../shared/loading.dart';
import '../../const.dart';
import 'checkIcon.dart';
import 'datesInfoCard.dart';
import 'horizontalMultipleSelection.dart';

import 'moodSelection.dart';
import 'multipleSelection.dart';
import 'notesAndActivities.dart';

class ToddlerReportE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final prm1ModelData = Provider.of<PRM1model>(context);
    customerAlertcheck(context: context);
    if (prm1ModelData == null ||
        prm1ModelData.pdf == null ||
        prm1ModelData.activities == null ||
        prm1ModelData.childName == null ||
        prm1ModelData.clothes == null ||
        prm1ModelData.dateA == null ||
        prm1ModelData.dateE == null ||
        prm1ModelData.diaper == null ||
        prm1ModelData.notes == null ||
        prm1ModelData.naps == null ||
        prm1ModelData.naps2 == null ||
        prm1ModelData.playoutside == null ||
        prm1ModelData.meals == null ||
        prm1ModelData.mood == null ||
        prm1ModelData.presence == null)
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
      return Scaffold(
        bottomNavigationBar: BottomBar(
          widgetName: "ToddlerReportE",
        ),
        backgroundColor: kbackgroundColor.withOpacity(1),
        appBar: AppBar(
          leading: BackArrowBotton(),
          centerTitle: false,
          titleSpacing: 0,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("Progress Report",
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(color: kIconColor.withOpacity(1), fontSize: 30)),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Image.asset("assets/images/PR/PRdec1.png")),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.0483092 * _width),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.0483092 * _width, vertical: 0.02 * _height),
                height: 0.78125 * _height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("${prm1ModelData.childName}`s Report",
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(
                                    color: kbackgroundColor.withOpacity(1),
                                    fontSize: 22)),
                        Spacer(),
                        InkWell(
                          onTap: () async {
                            String _url = prm1ModelData.pdf;
                            Navigator.push(
                              context,
                              OnBoardingPageRoute(
                                  duration: 600,
                                  widget: PdfScreen(
                                    pdfDriveUrl: _url,
                                  ),
                                  myAnimation: Curves.easeInOut),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(0.00558 * _height),
                            decoration: roundedContainer(
                                color: Colors.white, radius: 5.0),
                            child: SvgPicture.asset('assets/images/PR/pdf.svg',
                                height: 0.017161 * _height),
                          ),
                        ),
                        SizedBox(width: 0.05 * _width),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/PR/calendar.svg',
                            height: 0.0279 * _height),
                        SizedBox(
                          width: 0.038647 * _width,
                        ),
                        Row(
                          children: [
                            CheckIcon(
                              checked: prm1ModelData.presence,
                            ),
                            SizedBox(
                              width: 0.03 * _width,
                            ),
                            Text("Presence",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        color: kText4Color.withOpacity(1),
                                        fontSize: 12)),
                            SizedBox(
                              width: 0.02898551 * _width,
                            ),
                            CheckIcon(
                              checked: !prm1ModelData.presence,
                            ),
                            SizedBox(
                              width: 0.03 * _width,
                            ),
                            Text("Absence",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        color: kText4Color.withOpacity(1),
                                        fontSize: 12)),
                            SizedBox(
                              width: 0.05 * _width,
                            ),
                            Container(
                              width: 80,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  prm1ModelData.dateE,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          color: kText2Color.withOpacity(1),
                                          fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0.02 * _height),
                      width: 0.835748793 * _width,
                      decoration:
                          roundedContainer(color: Colors.white, radius: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // SizedBox(height: 0.01674*_height,),
                          ModesMultipleSelection(mood: prm1ModelData.mood),
                          Container(
                            width: 0.5386473 * _width,
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //,this.,this.description,this.
                              SizedBox(width: 0.02898551 * _width), //
                              DatesInfoCard(
                                  iconUrl: "assets/images/PR/nap.svg",
                                  title: "Nap",
                                  description: List.from(prm1ModelData.naps)),
                              Container(
                                color: kGreyColor.withOpacity(1),
                                height: 0.0747767857 * _height,
                                width: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //,this.,this.description,this.
                                  SizedBox(width: 0.02898551 * _width), //
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: DatesInfoCard(
                                        iconUrl: "assets/images/PR/nap.svg",
                                        title: "Nap2",
                                        description:
                                            List.from(prm1ModelData.naps2)),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            width: 0.5386473 * _width,
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          MultipleSelection(
                            iconUrl: 'assets/images/PR/Meals.svg',
                            currentState: prm1ModelData.meals,
                            options: mealsList,
                            title: 'Meals',
                          ),
                          Container(
                            width: 0.5386473 * _width,
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MultipleSelection(
                                iconUrl: 'assets/images/PR/Diaper.svg',
                                currentState: prm1ModelData.diaper,
                                options: diaperList,
                                title: 'Diaper',
                              ),
                              Visibility(
                                visible: prm1ModelData.diaper == 1,
                                child: Column(
                                  children: [
                                    LocaleText('Changes Times',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .copyWith(
                                                color:
                                                    kText4Color.withOpacity(1),
                                                fontSize: 12)),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        prm1ModelData.diaperTimes.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .copyWith(
                                                color:
                                                    kText4Color.withOpacity(1),
                                                fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HorizontalMultipleSelection(
                          currentState: prm1ModelData.playoutside ? 1 : 0,
                          iconUrl: 'assets/images/PR/playing.svg',
                          options: playingList,
                          title: 'PlayingOutside',
                        ),
                        Spacer(),
                        Container(
                            height: 0.1015625 * _height,
                            width: 0.38405797 * _width,
                            decoration: roundedContainer(
                                color: Colors.white, radius: 20.0),
                            child: DatesInfoCard(
                                iconUrl: "assets/images/PR/Clothes.svg",
                                title: "Clothes",
                                description: prm1ModelData.clothes)),
                      ],
                    ),
                    NotesAndActivities(
                      cardIcon: "assets/images/PR/Activities.svg",
                      content: prm1ModelData.activities,
                      title: "Activities",
                    ),
                    NotesAndActivities(
                      cardIcon: "assets/images/PR/Notes.svg",
                      content: prm1ModelData.notes,
                      title: "Notes",
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
  }
}
