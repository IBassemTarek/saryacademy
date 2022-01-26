import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/dateProvider.dart';
import 'package:saryacademy/models/profileInfoModels/childInfoModel.dart';
import 'package:saryacademy/models/progressReportModel4.dart';
import 'package:saryacademy/services/PRM4Database.dart';
import 'package:saryacademy/shared/customerAlertChecker.dart';
import 'package:saryacademy/shared/pageRouteAnimation.dart';

import '../../../screens/PRS1/gradeLable.dart';
import '../../../screens/PRS1/infoOfPR.dart';
import '../../../shared/backArrowBotton.dart';
import '../../../shared/bottombar.dart';
import '../../../shared/loading.dart';
import '../../const.dart';
import '../PRS2/pdfViewer.dart';

import 'package:intl/intl.dart';

class PRS3E extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final prm4ModelData = Provider.of<PRM4Listmodel>(context);
    final dateProviderData = Provider.of<DateProvider>(context);
    final prGrades = Provider.of<List<PR4Grades>>(context);
    final childId = Provider.of<ChildInfoModel>(context).uid;
    print(childId);
    final format = DateFormat("yyyy-MM-dd");
    customerAlertcheck(context: context);
    if (prm4ModelData == null ||
        prm4ModelData.studentNameA == null ||
        prm4ModelData.studentNameE == null)
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
            widgetName: "PRS3E",
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
          body: Stack(alignment: Alignment.center, children: [
            Align(
                alignment: Alignment.topRight,
                child: Image.asset("assets/images/PR/PRdec1.png")),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 0.0483092 * _width, vertical: 0.02 * _height),
              margin: EdgeInsets.symmetric(horizontal: 0.0483092 * _width),
              height: 0.78125 * _height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: Colors.white,
              ),
              child: ListView(
                  padding: EdgeInsets.only(bottom: 0.017857 * _height),
                  children: [
                    Row(
                      children: [
                        Text("${prm4ModelData.studentNameE}`s Report",
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(
                                    color: kbackgroundColor.withOpacity(1),
                                    fontSize: 22)),
                        Spacer(),
                        Column(
                          children: [
                            GradeLable(
                                gradeColor: kGoodColor,
                                gradeTitle: "Excellent",
                                fontSize: 11),
                            GradeLable(
                                gradeColor: kWorkingColor,
                                gradeTitle: "Very good",
                                fontSize: 11),
                            GradeLable(
                                gradeColor: kNotApplicableColor,
                                gradeTitle: "Good",
                                fontSize: 11),
                            GradeLable(
                                gradeColor: kWorkingColor,
                                gradeTitle: "Bad",
                                fontSize: 11)
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 0.0169 * _width),
                    Padding(
                      padding: EdgeInsets.only(right: _width * 0.4),
                      child: Container(
                        height: 0.043 * _height,
                        child: DateTimeField(
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 12, color: kGradColor1.withOpacity(1)),
                          format: format,
                          decoration: InputDecoration(
                            labelText: 'Select Date',
                            enabledBorder: OutlineInputBorder(
                              gapPadding: 0,
                              borderSide: BorderSide(
                                color: kGreyColor.withOpacity(1),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              Provider.of<DateProvider>(context, listen: false)
                                  .changeDate(Timestamp.fromDate(value));
                            }
                          },
                          onShowPicker: (context, currentValue) async {
                            return await showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100));
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 0.0169 * _width),
                    FutureBuilder(
                        future: PRM4DataBaseServices(uid: childId)
                            .checkifContain(date: dateProviderData.date),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState != ConnectionState.done)
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                              ),
                              height: 0.13392857 * _height,
                              width: 0.90338 * _width,
                              child: Loading(),
                            );
                          else if (snapshot.data == true) {
                            PR4Grades neededGrades = prGrades.firstWhere(
                              (element) =>
                                  DateFormat('yyyy-MM-dd').format(
                                      DateTime.fromMicrosecondsSinceEpoch(
                                          element
                                              .date.microsecondsSinceEpoch)) ==
                                  DateFormat('yyyy-MM-dd').format(
                                    DateTime.fromMicrosecondsSinceEpoch(
                                        dateProviderData
                                            .date.microsecondsSinceEpoch),
                                  ),
                            );

                            int neededGradeIndex =
                                prGrades.indexOf(neededGrades);

                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 0.02232 * _height,
                                      width: 0.3 * _width,
                                      decoration: roundedContainer(
                                              color: kIconColor.withOpacity(1),
                                              radius: 20.0)
                                          .copyWith(boxShadow: []),
                                      child: Center(
                                        child: Text(
                                          "Preschool Stage 3",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 0.05 * _width,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        String _url = neededGrades.pdf;
                                        String _decodeduri =
                                            Uri.decodeFull(_url);
                                        print(_url);
                                        print(_decodeduri);
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
                                        padding:
                                            EdgeInsets.all(0.00558 * _height),
                                        decoration: roundedContainer(
                                            color: Colors.white, radius: 5.0),
                                        child: SvgPicture.asset(
                                            'assets/images/PR/pdf.svg',
                                            height: 0.017161 * _height),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 0.03 * _width),
                                Center(
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0.0111607 * _width,
                                          horizontal: 0.02 * _height),
                                      // height: 0.222893 * _height,
                                      width: 0.763285 * _width,
                                      decoration: roundedContainer(
                                          color: Colors.white, radius: 20.0),
                                      child: PRInfo(
                                        neededGradeIndex: neededGradeIndex,
                                        title:
                                            "Academic and educational skills",
                                        dataNotes: educationalSkillsE,
                                        english: true,
                                        dataNotesAnswersMonth1:
                                            neededGrades.academicSkills,
                                        dividerHeight: 0.169045 * _height,
                                      )),
                                ),
                                SizedBox(height: 0.03567 * _width),
                                Center(
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0.0111607 * _width,
                                          horizontal: 0.02 * _height),
                                      width: 0.763285 * _width,
                                      decoration: roundedContainer(
                                          color: Colors.white, radius: 20.0),
                                      child: PRInfo(
                                        neededGradeIndex: neededGradeIndex,
                                        title: "Social and Emotional skills",
                                        dataNotes: socialEmotionalSkillsE,
                                        english: true,
                                        dataNotesAnswersMonth1:
                                            neededGrades.socialSkills,
                                        dividerHeight: 0.067 * _height,
                                      )),
                                ),
                                SizedBox(height: 0.03567 * _width),
                                Center(
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0.0111607 * _width,
                                          horizontal: 0.02 * _height),
                                      width: 0.763285 * _width,
                                      decoration: roundedContainer(
                                          color: Colors.white, radius: 20.0),
                                      child: PRInfo(
                                        neededGradeIndex: neededGradeIndex,
                                        title: "Work Habits",
                                        english: true,
                                        dataNotes: workHabitsE,
                                        dataNotesAnswersMonth1:
                                            neededGrades.workHabits,
                                        dividerHeight: 0.2449375 * _height,
                                      )),
                                ),
                                SizedBox(height: 0.03567 * _width),
                                Center(
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0.0111607 * _width,
                                          horizontal: 0.02 * _height),
                                      width: 0.763285 * _width,
                                      decoration: roundedContainer(
                                          color: Colors.white, radius: 20.0),
                                      child: PRInfo(
                                        neededGradeIndex: neededGradeIndex,
                                        title: "Art Skills",
                                        english: true,
                                        dataNotes: artSkillsE,
                                        dataNotesAnswersMonth1:
                                            neededGrades.artSkills,
                                        dividerHeight: 0.2449375 * _height,
                                      )),
                                ),
                                SizedBox(height: 0.03567 * _width),
                                Center(
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0.0111607 * _width,
                                          horizontal: 0.02 * _height),
                                      width: 0.763285 * _width,
                                      decoration: roundedContainer(
                                          color: Colors.white, radius: 20.0),
                                      child: PRInfo(
                                        neededGradeIndex: neededGradeIndex,
                                        title: "Speaking Skills",
                                        english: true,
                                        dataNotes: speakingSkillsE,
                                        dataNotesAnswersMonth1:
                                            neededGrades.speakingSkills,
                                        dividerHeight: 0.2449375 * _height,
                                      )),
                                ),
                                SizedBox(height: 0.03567 * _width),
                                Center(
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0.0111607 * _width,
                                          horizontal: 0.02 * _height),
                                      width: 0.763285 * _width,
                                      decoration: roundedContainer(
                                          color: Colors.white, radius: 20.0),
                                      child: PRInfo(
                                        neededGradeIndex: neededGradeIndex,
                                        title: "Music Skills",
                                        english: true,
                                        dataNotes: musicSkillsE,
                                        dataNotesAnswersMonth1:
                                            neededGrades.musicSkills,
                                        dividerHeight: 0.2449375 * _height,
                                      )),
                                ),
                              ],
                            );
                          } else
                            return Container(
                              height: _height / 2,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/noData.png"),
                                  SizedBox(
                                    height: 0.06 * _height,
                                  ),
                                  Text(
                                    "This day was not found",
                                    // textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        .copyWith(
                                            color:
                                                kbackgroundColor.withOpacity(1),
                                            fontSize: 22),
                                  ),
                                ],
                              ),
                            );
                        }),
                  ]),
            ),
          ]));
  }
}
