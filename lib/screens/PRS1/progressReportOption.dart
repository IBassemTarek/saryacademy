import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/progressReportModel2.dart';
import 'package:saryacademy/models/progressReportModel4.dart';
import 'package:saryacademy/services/PRM4Database.dart';

import '../../../models/childUID.dart';
import '../../../models/profileInfoModels/childInfoModel.dart';
import '../../../models/progressReportModel3.dart';
import '../../../services/PRM2Database.dart';
import '../../../services/PRM3Database.dart';

import 'gradeLable.dart';

class ProgressReportOption extends StatelessWidget {
  final String gradeTitle;
  final Color gradeColor;
  final String title;
  final int mounthNo;
  final int index;
  final int neededGradeIndex;
  ProgressReportOption({
    this.gradeTitle,
    this.gradeColor,
    this.mounthNo,
    this.index,
    @required this.title,
    @required this.neededGradeIndex,
  });
  @override
  Widget build(BuildContext context) {
    final uid = Provider.of<ChildModel>(context).uid;
    final prGrades = Provider.of<List<PR2Grades>>(context);
    final pr2Grades = Provider.of<List<PR3Grades>>(context);
    final pr3Grades = Provider.of<List<PR4Grades>>(context);
    final reportType =
        Provider.of<ChildInfoModel>(context, listen: false).reportType;

    String docId;

    String getId() {
      if (reportType == 2) {
        return DateTime.fromMicrosecondsSinceEpoch(
                    prGrades[neededGradeIndex].date.microsecondsSinceEpoch)
                .day
                .toString() +
            "-" +
            DateTime.fromMicrosecondsSinceEpoch(
                    prGrades[neededGradeIndex].date.microsecondsSinceEpoch)
                .month
                .toString() +
            "-" +
            DateTime.fromMicrosecondsSinceEpoch(
                    prGrades[neededGradeIndex].date.microsecondsSinceEpoch)
                .year
                .toString();
      } else if (reportType == 3) {
        return DateTime.fromMicrosecondsSinceEpoch(
                    pr2Grades[neededGradeIndex].date.microsecondsSinceEpoch)
                .day
                .toString() +
            "-" +
            DateTime.fromMicrosecondsSinceEpoch(
                    pr2Grades[neededGradeIndex].date.microsecondsSinceEpoch)
                .month
                .toString() +
            "-" +
            DateTime.fromMicrosecondsSinceEpoch(
                    pr2Grades[neededGradeIndex].date.microsecondsSinceEpoch)
                .year
                .toString();
      } else {
        return DateTime.fromMicrosecondsSinceEpoch(
                    pr3Grades[neededGradeIndex].date.microsecondsSinceEpoch)
                .day
                .toString() +
            "-" +
            DateTime.fromMicrosecondsSinceEpoch(
                    pr3Grades[neededGradeIndex].date.microsecondsSinceEpoch)
                .month
                .toString() +
            "-" +
            DateTime.fromMicrosecondsSinceEpoch(
                    pr3Grades[neededGradeIndex].date.microsecondsSinceEpoch)
                .year
                .toString();
      }
    }

    docId = getId();
    print(docId);

    return new InkWell(
      onTap: () {
        print(title);
        switch (title) {
          case "Academic and educational skills":
            {
              print(index);
              switch (gradeTitle) {
                case "Bad":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].academicSkills[index] = 0
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .academicSkills[index] = 0
                              : pr3Grades[neededGradeIndex]
                                  .academicSkills[index] = 0;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateAcademicSkills(
                              skills: prGrades[neededGradeIndex].academicSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateAcademicSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .academicSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateAcademicSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .academicSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "Very good":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].academicSkills[index] = 2
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .academicSkills[index] = 2
                              : pr3Grades[neededGradeIndex]
                                  .academicSkills[index] = 2;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateAcademicSkills(
                              skills: prGrades[neededGradeIndex].academicSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateAcademicSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .academicSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateAcademicSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .academicSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "Excellent":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].academicSkills[index] = 1
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .academicSkills[index] = 1
                              : pr3Grades[neededGradeIndex]
                                  .academicSkills[index] = 1;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateAcademicSkills(
                              skills: prGrades[neededGradeIndex].academicSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateAcademicSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .academicSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateAcademicSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .academicSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "Good":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].academicSkills[index] = 3
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .academicSkills[index] = 3
                              : pr3Grades[neededGradeIndex]
                                  .academicSkills[index] = 3;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateAcademicSkills(
                              skills: prGrades[neededGradeIndex].academicSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateAcademicSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .academicSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateAcademicSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .academicSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;

                case "سيء":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].academicSkills[index] = 0
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .academicSkills[index] = 0
                              : pr3Grades[neededGradeIndex]
                                  .academicSkills[index] = 0;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateAcademicSkills(
                              skills: prGrades[neededGradeIndex].academicSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateAcademicSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .academicSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateAcademicSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .academicSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "جيد جدا":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].academicSkills[index] = 2
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .academicSkills[index] = 2
                              : pr3Grades[neededGradeIndex]
                                  .academicSkills[index] = 2;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateAcademicSkills(
                              skills: prGrades[neededGradeIndex].academicSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateAcademicSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .academicSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateAcademicSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .academicSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "ممتاز":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].academicSkills[index] = 1
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .academicSkills[index] = 1
                              : pr3Grades[neededGradeIndex]
                                  .academicSkills[index] = 1;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateAcademicSkills(
                              skills: prGrades[neededGradeIndex].academicSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateAcademicSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .academicSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateAcademicSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .academicSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "جيد":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].academicSkills[index] = 3
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .academicSkills[index] = 3
                              : pr3Grades[neededGradeIndex]
                                  .academicSkills[index] = 3;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateAcademicSkills(
                              skills: prGrades[neededGradeIndex].academicSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateAcademicSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .academicSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateAcademicSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .academicSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
              }
            }
            break;
          case "Social and Emotional skills":
            {
              print(index);
              switch (gradeTitle) {
                case "Bad":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].socialSkills[index] = 0
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .socialSkills[index] = 0
                              : pr3Grades[neededGradeIndex]
                                  .socialSkills[index] = 0;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateSocialSkills(
                              skills: prGrades[neededGradeIndex].socialSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateSocialSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .socialSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateSocialSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .socialSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "Very good":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].socialSkills[index] = 2
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .socialSkills[index] = 2
                              : pr3Grades[neededGradeIndex]
                                  .socialSkills[index] = 2;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateSocialSkills(
                              skills: prGrades[neededGradeIndex].socialSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateSocialSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .socialSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateSocialSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .socialSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "Excellent":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].socialSkills[index] = 1
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .socialSkills[index] = 1
                              : pr3Grades[neededGradeIndex]
                                  .socialSkills[index] = 1;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateSocialSkills(
                              skills: prGrades[neededGradeIndex].socialSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateSocialSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .socialSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateSocialSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .socialSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "Good":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].socialSkills[index] = 3
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .socialSkills[index] = 3
                              : pr3Grades[neededGradeIndex]
                                  .socialSkills[index] = 3;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateSocialSkills(
                              skills: prGrades[neededGradeIndex].socialSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateSocialSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .socialSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateSocialSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .socialSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;

                case "سيء":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].socialSkills[index] = 0
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .socialSkills[index] = 0
                              : pr3Grades[neededGradeIndex]
                                  .socialSkills[index] = 0;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateSocialSkills(
                              skills: prGrades[neededGradeIndex].socialSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateSocialSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .socialSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateSocialSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .socialSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "جيد جدا":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].socialSkills[index] = 2
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .socialSkills[index] = 2
                              : pr3Grades[neededGradeIndex]
                                  .socialSkills[index] = 2;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateSocialSkills(
                              skills: prGrades[neededGradeIndex].socialSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateSocialSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .socialSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateSocialSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .socialSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "ممتاز":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].socialSkills[index] = 1
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .socialSkills[index] = 1
                              : pr3Grades[neededGradeIndex]
                                  .socialSkills[index] = 1;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateSocialSkills(
                              skills: prGrades[neededGradeIndex].socialSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateSocialSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .socialSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateSocialSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .socialSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "جيد":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].socialSkills[index] = 3
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .socialSkills[index] = 3
                              : pr3Grades[neededGradeIndex]
                                  .socialSkills[index] = 3;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateSocialSkills(
                              skills: prGrades[neededGradeIndex].socialSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateSocialSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .socialSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateSocialSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .socialSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
              }
            }
            break;

          case "Work Habits":
            {
              print(index);
              switch (gradeTitle) {
                case "Bad":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].workHabits[index] = 0
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].workHabits[index] =
                                  0
                              : pr3Grades[neededGradeIndex].workHabits[index] =
                                  0;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateWorkHabits(
                              skills: prGrades[neededGradeIndex].workHabits,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid).updateWorkHabits(
                                  skills:
                                      pr2Grades[neededGradeIndex].workHabits,
                                  dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid).updateWorkHabits(
                                  skills:
                                      pr3Grades[neededGradeIndex].workHabits,
                                  dateDoc: docId);
                    }
                  }
                  break;
                case "Very good":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].workHabits[index] = 2
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].workHabits[index] =
                                  2
                              : pr3Grades[neededGradeIndex].workHabits[index] =
                                  2;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateWorkHabits(
                              skills: prGrades[neededGradeIndex].workHabits,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid).updateWorkHabits(
                                  skills:
                                      pr2Grades[neededGradeIndex].workHabits,
                                  dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid).updateWorkHabits(
                                  skills:
                                      pr3Grades[neededGradeIndex].workHabits,
                                  dateDoc: docId);
                    }
                  }
                  break;
                case "Excellent":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].workHabits[index] = 1
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].workHabits[index] =
                                  1
                              : pr3Grades[neededGradeIndex].workHabits[index] =
                                  1;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateWorkHabits(
                              skills: prGrades[neededGradeIndex].workHabits,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid).updateWorkHabits(
                                  skills:
                                      pr2Grades[neededGradeIndex].workHabits,
                                  dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid).updateWorkHabits(
                                  skills:
                                      pr3Grades[neededGradeIndex].workHabits,
                                  dateDoc: docId);
                    }
                  }
                  break;
                case "Good":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].workHabits[index] = 3
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].workHabits[index] =
                                  3
                              : pr3Grades[neededGradeIndex].workHabits[index] =
                                  3;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateWorkHabits(
                              skills: prGrades[neededGradeIndex].workHabits,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid).updateWorkHabits(
                                  skills:
                                      pr2Grades[neededGradeIndex].workHabits,
                                  dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid).updateWorkHabits(
                                  skills:
                                      pr3Grades[neededGradeIndex].workHabits,
                                  dateDoc: docId);
                    }
                  }
                  break;

                case "سيء":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].workHabits[index] = 0
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].workHabits[index] =
                                  0
                              : pr3Grades[neededGradeIndex].workHabits[index] =
                                  0;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateWorkHabits(
                              skills: prGrades[neededGradeIndex].workHabits,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid).updateWorkHabits(
                                  skills:
                                      pr2Grades[neededGradeIndex].workHabits,
                                  dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid).updateWorkHabits(
                                  skills:
                                      pr3Grades[neededGradeIndex].workHabits,
                                  dateDoc: docId);
                    }
                  }
                  break;
                case "جيد جدا":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].workHabits[index] = 2
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].workHabits[index] =
                                  2
                              : pr3Grades[neededGradeIndex].workHabits[index] =
                                  2;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateWorkHabits(
                              skills: prGrades[neededGradeIndex].workHabits,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid).updateWorkHabits(
                                  skills:
                                      pr2Grades[neededGradeIndex].workHabits,
                                  dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid).updateWorkHabits(
                                  skills:
                                      pr3Grades[neededGradeIndex].workHabits,
                                  dateDoc: docId);
                    }
                  }
                  break;
                case "ممتاز":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].workHabits[index] = 1
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].workHabits[index] =
                                  1
                              : pr3Grades[neededGradeIndex].workHabits[index] =
                                  1;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateWorkHabits(
                              skills: prGrades[neededGradeIndex].workHabits,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid).updateWorkHabits(
                                  skills:
                                      pr2Grades[neededGradeIndex].workHabits,
                                  dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid).updateWorkHabits(
                                  skills:
                                      pr3Grades[neededGradeIndex].workHabits,
                                  dateDoc: docId);
                    }
                  }
                  break;
                case "جيد":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].workHabits[index] = 3
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].workHabits[index] =
                                  3
                              : pr3Grades[neededGradeIndex].workHabits[index] =
                                  3;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateWorkHabits(
                              skills: prGrades[neededGradeIndex].workHabits,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid).updateWorkHabits(
                                  skills:
                                      pr2Grades[neededGradeIndex].workHabits,
                                  dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid).updateWorkHabits(
                                  skills:
                                      pr3Grades[neededGradeIndex].workHabits,
                                  dateDoc: docId);
                    }
                  }
                  break;
              }
            }
            break;

          case "Art Skills":
            {
              print(index);
              switch (gradeTitle) {
                case "Bad":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].artSkills[index] = 0
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].artSkills[index] = 0
                              : pr3Grades[neededGradeIndex].artSkills[index] =
                                  0;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateArtSkills(
                              skills: prGrades[neededGradeIndex].artSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid).updateArtSkills(
                                  skills: pr2Grades[neededGradeIndex].artSkills,
                                  dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid).updateArtSkills(
                                  skills: pr3Grades[neededGradeIndex].artSkills,
                                  dateDoc: docId);
                    }
                  }
                  break;
                case "Very good":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].artSkills[index] = 2
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].artSkills[index] = 2
                              : pr3Grades[neededGradeIndex].artSkills[index] =
                                  2;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateArtSkills(
                              skills: prGrades[neededGradeIndex].artSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid).updateArtSkills(
                                  skills: pr2Grades[neededGradeIndex].artSkills,
                                  dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid).updateArtSkills(
                                  skills: pr3Grades[neededGradeIndex].artSkills,
                                  dateDoc: docId);
                    }
                  }
                  break;
                case "Excellent":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].artSkills[index] = 1
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].artSkills[index] = 1
                              : pr3Grades[neededGradeIndex].artSkills[index] =
                                  1;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateArtSkills(
                              skills: prGrades[neededGradeIndex].artSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid).updateArtSkills(
                                  skills: pr2Grades[neededGradeIndex].artSkills,
                                  dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid).updateArtSkills(
                                  skills: pr3Grades[neededGradeIndex].artSkills,
                                  dateDoc: docId);
                    }
                  }
                  break;
                case "Good":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].artSkills[index] = 3
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].artSkills[index] = 3
                              : pr3Grades[neededGradeIndex].artSkills[index] =
                                  3;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateArtSkills(
                              skills: prGrades[neededGradeIndex].artSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid).updateArtSkills(
                                  skills: pr2Grades[neededGradeIndex].artSkills,
                                  dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid).updateArtSkills(
                                  skills: pr3Grades[neededGradeIndex].artSkills,
                                  dateDoc: docId);
                    }
                  }
                  break;

                case "سيء":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].artSkills[index] = 0
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].artSkills[index] = 0
                              : pr3Grades[neededGradeIndex].artSkills[index] =
                                  0;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateArtSkills(
                              skills: prGrades[neededGradeIndex].artSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid).updateArtSkills(
                                  skills: pr2Grades[neededGradeIndex].artSkills,
                                  dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid).updateArtSkills(
                                  skills: pr3Grades[neededGradeIndex].artSkills,
                                  dateDoc: docId);
                    }
                  }
                  break;
                case "جيد جدا":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].artSkills[index] = 2
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].artSkills[index] = 2
                              : pr3Grades[neededGradeIndex].artSkills[index] =
                                  2;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateArtSkills(
                              skills: prGrades[neededGradeIndex].artSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid).updateArtSkills(
                                  skills: pr2Grades[neededGradeIndex].artSkills,
                                  dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid).updateArtSkills(
                                  skills: pr3Grades[neededGradeIndex].artSkills,
                                  dateDoc: docId);
                    }
                  }
                  break;
                case "ممتاز":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].artSkills[index] = 1
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].artSkills[index] = 1
                              : pr3Grades[neededGradeIndex].artSkills[index] =
                                  1;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateArtSkills(
                              skills: prGrades[neededGradeIndex].artSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid).updateArtSkills(
                                  skills: pr2Grades[neededGradeIndex].artSkills,
                                  dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid).updateArtSkills(
                                  skills: pr3Grades[neededGradeIndex].artSkills,
                                  dateDoc: docId);
                    }
                  }
                  break;
                case "جيد":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].artSkills[index] = 3
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].artSkills[index] = 3
                              : pr3Grades[neededGradeIndex].artSkills[index] =
                                  3;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateArtSkills(
                              skills: prGrades[neededGradeIndex].artSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid).updateArtSkills(
                                  skills: pr2Grades[neededGradeIndex].artSkills,
                                  dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid).updateArtSkills(
                                  skills: pr3Grades[neededGradeIndex].artSkills,
                                  dateDoc: docId);
                    }
                  }
                  break;
              }
            }
            break;

          case "Speaking Skills":
            {
              print(index);
              switch (gradeTitle) {
                case "Bad":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].speakingSkills[index] = 0
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .speakingSkills[index] = 0
                              : pr3Grades[neededGradeIndex]
                                  .speakingSkills[index] = 0;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateSpeakingSkills(
                              skills: prGrades[neededGradeIndex].speakingSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateSpeakingSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .speakingSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateSpeakingSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .speakingSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "Very good":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].speakingSkills[index] = 2
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .speakingSkills[index] = 2
                              : pr3Grades[neededGradeIndex]
                                  .speakingSkills[index] = 2;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateSpeakingSkills(
                              skills: prGrades[neededGradeIndex].speakingSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateSpeakingSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .speakingSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateSpeakingSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .speakingSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "Excellent":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].speakingSkills[index] = 1
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .speakingSkills[index] = 1
                              : pr3Grades[neededGradeIndex]
                                  .speakingSkills[index] = 1;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateSpeakingSkills(
                              skills: prGrades[neededGradeIndex].speakingSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateSpeakingSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .speakingSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateSpeakingSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .speakingSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "Good":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].speakingSkills[index] = 3
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .speakingSkills[index] = 3
                              : pr3Grades[neededGradeIndex]
                                  .speakingSkills[index] = 3;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateSpeakingSkills(
                              skills: prGrades[neededGradeIndex].speakingSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateSpeakingSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .speakingSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateSpeakingSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .speakingSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;

                case "سيء":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].speakingSkills[index] = 0
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .speakingSkills[index] = 0
                              : pr3Grades[neededGradeIndex]
                                  .speakingSkills[index] = 0;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateSpeakingSkills(
                              skills: prGrades[neededGradeIndex].speakingSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateSpeakingSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .speakingSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateSpeakingSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .speakingSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "جيد جدا":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].speakingSkills[index] = 2
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .speakingSkills[index] = 2
                              : pr3Grades[neededGradeIndex]
                                  .speakingSkills[index] = 2;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateSpeakingSkills(
                              skills: prGrades[neededGradeIndex].speakingSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateSpeakingSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .speakingSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateSpeakingSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .speakingSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "ممتاز":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].speakingSkills[index] = 1
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .speakingSkills[index] = 1
                              : pr3Grades[neededGradeIndex]
                                  .speakingSkills[index] = 1;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateSpeakingSkills(
                              skills: prGrades[neededGradeIndex].speakingSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateSpeakingSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .speakingSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateSpeakingSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .speakingSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "جيد":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].speakingSkills[index] = 3
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex]
                                  .speakingSkills[index] = 3
                              : pr3Grades[neededGradeIndex]
                                  .speakingSkills[index] = 3;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateSpeakingSkills(
                              skills: prGrades[neededGradeIndex].speakingSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateSpeakingSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .speakingSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateSpeakingSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .speakingSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
              }
            }
            break;

          case "Music Skills":
            {
              print(index);
              switch (gradeTitle) {
                case "Bad":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].musicSkills[index] = 0
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].musicSkills[index] =
                                  0
                              : pr3Grades[neededGradeIndex].musicSkills[index] =
                                  0;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateMusicSkills(
                              skills: prGrades[neededGradeIndex].musicSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateMusicSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .musicSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateMusicSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .musicSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "Very good":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].musicSkills[index] = 2
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].musicSkills[index] =
                                  2
                              : pr3Grades[neededGradeIndex].musicSkills[index] =
                                  2;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateMusicSkills(
                              skills: prGrades[neededGradeIndex].musicSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateMusicSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .musicSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateMusicSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .musicSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "Excellent":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].musicSkills[index] = 1
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].musicSkills[index] =
                                  1
                              : pr3Grades[neededGradeIndex].musicSkills[index] =
                                  1;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateMusicSkills(
                              skills: prGrades[neededGradeIndex].musicSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateMusicSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .musicSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateMusicSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .musicSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "Good":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].musicSkills[index] = 3
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].musicSkills[index] =
                                  3
                              : pr3Grades[neededGradeIndex].musicSkills[index] =
                                  3;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateMusicSkills(
                              skills: prGrades[neededGradeIndex].musicSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateMusicSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .musicSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateMusicSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .musicSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;

                case "سيء":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].musicSkills[index] = 0
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].musicSkills[index] =
                                  0
                              : pr3Grades[neededGradeIndex].musicSkills[index] =
                                  0;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateMusicSkills(
                              skills: prGrades[neededGradeIndex].musicSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateMusicSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .musicSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateMusicSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .musicSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "جيد جدا":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].musicSkills[index] = 2
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].musicSkills[index] =
                                  2
                              : pr3Grades[neededGradeIndex].musicSkills[index] =
                                  2;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateMusicSkills(
                              skills: prGrades[neededGradeIndex].musicSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateMusicSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .musicSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateMusicSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .musicSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "ممتاز":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].musicSkills[index] = 1
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].musicSkills[index] =
                                  1
                              : pr3Grades[neededGradeIndex].musicSkills[index] =
                                  1;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateMusicSkills(
                              skills: prGrades[neededGradeIndex].musicSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateMusicSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .musicSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateMusicSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .musicSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
                case "جيد":
                  {
                    if (reportType != null && reportType < 5) {
                      (reportType == 2)
                          ? prGrades[neededGradeIndex].musicSkills[index] = 3
                          : (reportType == 3)
                              ? pr2Grades[neededGradeIndex].musicSkills[index] =
                                  3
                              : pr3Grades[neededGradeIndex].musicSkills[index] =
                                  3;

                      (reportType == 2)
                          ? PRM2DataBaseServices(uid: uid).updateMusicSkills(
                              skills: prGrades[neededGradeIndex].musicSkills,
                              dateDoc: docId)
                          : (reportType == 3)
                              ? PRM3DataBaseServices(uid: uid)
                                  .updateMusicSkills(
                                      skills: pr2Grades[neededGradeIndex]
                                          .musicSkills,
                                      dateDoc: docId)
                              : PRM4DataBaseServices(uid: uid)
                                  .updateMusicSkills(
                                      skills: pr3Grades[neededGradeIndex]
                                          .musicSkills,
                                      dateDoc: docId);
                    }
                  }
                  break;
              }
            }
            break;
        }
        Navigator.of(context).pop();
      },
      child: GradeLable(
        gradeColor: gradeColor,
        gradeTitle: gradeTitle,
        fontSize: 12,
      ),
    );
  }
}
