import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/childUID.dart';
import 'package:saryacademy/models/dateProvider.dart';
import 'package:saryacademy/models/progressReportModel4.dart';
import 'package:saryacademy/screens/adminScreens/adminToddlerReport/uploadlocalpdf.dart';
import 'package:intl/intl.dart';
import 'package:saryacademy/screens/adminScreens/childEvents/addButtom.dart';
import 'package:saryacademy/services/PRM4Database.dart';
import '../../../shared/alertchecker.dart';
import '../../PRS1/nameAlert.dart';
import '../../PRS1/gradeLable.dart';
import '../../PRS1/infoOfPR.dart';
import '../../../shared/backArrowBotton.dart';
import '../../../shared/loading.dart';
import '../../../const.dart';

class AdminPRS3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final prm4ModelData = Provider.of<PRM4Listmodel>(context);
    final dateProviderData = Provider.of<DateProvider>(context);
    final pr2Grades = Provider.of<List<PR4Grades>>(context);
    final childUser = Provider.of<ChildModel>(context);
    final format = DateFormat("yyyy-MM-dd");
    alertcheck(context: context);
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
          backgroundColor: kbackgroundColor.withOpacity(1),
          appBar: AppBar(
            leading: BackArrowBotton(),
            centerTitle: false,
            titleSpacing: 0,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: LocaleText("Progress Report",
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 150,
                                child: FittedBox(
                                    child: Text(
                                        "${prm4ModelData.studentNameE}`s Report",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            .copyWith(
                                                color: kbackgroundColor
                                                    .withOpacity(1),
                                                fontSize: 10)))),
                            SizedBox(
                              width: 5,
                            ),
                            InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        NameAlert(
                                      reportType: 4,
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.edit,
                                  size: 15,
                                  color: kbackgroundColor.withOpacity(1),
                                )),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            GradeLable(
                                gradeColor: kGoodColor,
                                gradeTitle:
                                    Locales.currentLocale(context).toString() ==
                                            "ar"
                                        ? "ممتاز"
                                        : "Excellent",
                                fontSize: 12),
                            SizedBox(
                              height: 0.01 * _width,
                            ),
                            GradeLable(
                                gradeColor: kWorkingColor,
                                gradeTitle:
                                    Locales.currentLocale(context).toString() ==
                                            "ar"
                                        ? "جيد جدا"
                                        : "Very good",
                                fontSize: 12),
                            SizedBox(
                              height: 0.01 * _width,
                            ),
                            GradeLable(
                                gradeColor: kNotApplicableColor,
                                gradeTitle:
                                    Locales.currentLocale(context).toString() ==
                                            "ar"
                                        ? "جيد"
                                        : "Good",
                                fontSize: 12),
                            SizedBox(
                              height: 0.01 * _width,
                            ),
                            GradeLable(
                                gradeColor: kWorkingColor,
                                gradeTitle:
                                    Locales.currentLocale(context).toString() ==
                                            "ar"
                                        ? "سيء"
                                        : "Bad",
                                fontSize: 12)
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 0.0169 * _width),
                    Padding(
                      padding: Locales.currentLocale(context).toString() == "ar"
                          ? EdgeInsets.only(right: 20, left: _width * 0.4)
                          : EdgeInsets.only(left: 20, right: _width * 0.4),
                      child: Container(
                        height: 0.043 * _height,
                        child: DateTimeField(
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 12, color: kGradColor1.withOpacity(1)),
                          // initialValue: DateTime.fromMicrosecondsSinceEpoch(
                          //     dateProviderData.date.microsecondsSinceEpoch),
                          format: format,
                          decoration: InputDecoration(
                            labelText:
                                Locales.currentLocale(context).toString() ==
                                        "ar"
                                    ? "إختر التاريخ"
                                    : 'Select Date',
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
                        future: PRM4DataBaseServices(uid: childUser.uid)
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
                            PR4Grades neededGrades = pr2Grades.firstWhere(
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
                                pr2Grades.indexOf(neededGrades);
                            return Column(
                              children: [
                                Align(
                                  alignment: Locales.currentLocale(context)
                                              .toString() ==
                                          "ar"
                                      ? Alignment.bottomRight
                                      : Alignment.bottomLeft,
                                  child: Container(
                                    width: 0.4 * _width,
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding:
                                                Locales.currentLocale(context)
                                                            .toString() ==
                                                        "ar"
                                                    ? EdgeInsets.only(right: 20)
                                                    : EdgeInsets.only(left: 20),
                                            child: PDFGetLocal(
                                              date: DateTime.fromMicrosecondsSinceEpoch(
                                                          dateProviderData.date
                                                              .microsecondsSinceEpoch)
                                                      .day
                                                      .toString() +
                                                  "-" +
                                                  DateTime.fromMicrosecondsSinceEpoch(
                                                          dateProviderData.date
                                                              .microsecondsSinceEpoch)
                                                      .month
                                                      .toString() +
                                                  "-" +
                                                  DateTime.fromMicrosecondsSinceEpoch(
                                                          dateProviderData.date
                                                              .microsecondsSinceEpoch)
                                                      .year
                                                      .toString(),
                                              reportType: Type.report3,
                                            ),
                                          ),
                                          SizedBox(height: 0.0169 * _width),
                                          Container(
                                            height: 0.02232 * _height,
                                            width: 0.3 * _width,
                                            decoration: roundedContainer(
                                                    color: kIconColor
                                                        .withOpacity(1),
                                                    radius: 20.0)
                                                .copyWith(boxShadow: []),
                                            child: Center(
                                                child: LocaleText(
                                                    "Preschool Stage 3",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        .copyWith(
                                                            color: Colors.white,
                                                            fontSize: 12))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 0.0169 * _width),
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
                                        dataNotes:
                                            Locales.currentLocale(context)
                                                        .toString() ==
                                                    "ar"
                                                ? educationalSkillsA
                                                : educationalSkillsE,
                                        english: Locales.currentLocale(context)
                                                    .toString() ==
                                                "ar"
                                            ? false
                                            : true,
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
                                        dataNotes:
                                            Locales.currentLocale(context)
                                                        .toString() ==
                                                    "ar"
                                                ? socialEmotionalSkillsA
                                                : socialEmotionalSkillsE,
                                        english: Locales.currentLocale(context)
                                                    .toString() ==
                                                "ar"
                                            ? false
                                            : true,
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
                                        english: Locales.currentLocale(context)
                                                    .toString() ==
                                                "ar"
                                            ? false
                                            : true,
                                        dataNotes:
                                            Locales.currentLocale(context)
                                                        .toString() ==
                                                    "ar"
                                                ? workHabitsA
                                                : workHabitsE,
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
                                        english: Locales.currentLocale(context)
                                                    .toString() ==
                                                "ar"
                                            ? false
                                            : true,
                                        dataNotes:
                                            Locales.currentLocale(context)
                                                        .toString() ==
                                                    "ar"
                                                ? artSkillsA
                                                : artSkillsE,
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
                                        english: Locales.currentLocale(context)
                                                    .toString() ==
                                                "ar"
                                            ? false
                                            : true,
                                        dataNotes:
                                            Locales.currentLocale(context)
                                                        .toString() ==
                                                    "ar"
                                                ? speakingSkillsA
                                                : speakingSkillsE,
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
                                        english: Locales.currentLocale(context)
                                                    .toString() ==
                                                "ar"
                                            ? false
                                            : true,
                                        dataNotes:
                                            Locales.currentLocale(context)
                                                        .toString() ==
                                                    "ar"
                                                ? musicSkillsA
                                                : musicSkillsE,
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    LocaleText(
                                      "reportNotFound1",
                                      // textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          .copyWith(
                                              color: kbackgroundColor
                                                  .withOpacity(1),
                                              fontSize: 22),
                                    ),
                                    LocaleText(
                                      "reportNotFound2",
                                      // textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          .copyWith(
                                              color: kbackgroundColor
                                                  .withOpacity(1),
                                              fontSize: 22),
                                    ),
                                    SizedBox(height: 0.03567 * _width),
                                    AddBotton(
                                      text: 'Add',
                                      onTap: () async {
                                        DateTime neededDate =
                                            DateTime.fromMicrosecondsSinceEpoch(
                                                dateProviderData.date
                                                    .microsecondsSinceEpoch);
                                        await PRM4DataBaseServices(
                                                uid: childUser.uid)
                                            .initprGrades(
                                          dateDoc: neededDate.day.toString() +
                                              "-" +
                                              neededDate.month.toString() +
                                              "-" +
                                              neededDate.year.toString(),
                                          academicSkills: [0, 0, 0, 0, 0, 0],
                                          socialSkills: [0, 0, 0, 0, 0, 0],
                                          workHabits: [0, 0, 0, 0, 0, 0, 0],
                                          artSkills: [
                                            0,
                                            0,
                                            0,
                                            0,
                                            0,
                                            0,
                                            0,
                                            0,
                                            0,
                                            0,
                                            0
                                          ],
                                          pdf: '',
                                          speakingSkills: [0, 0, 0, 0, 0, 0],
                                          musicSkills: [0, 0, 0],
                                          date: dateProviderData.date,
                                        );
                                      },
                                    )
                                  ],
                                ));
                        }),
                  ]),
            ),
          ]));
  }
}
