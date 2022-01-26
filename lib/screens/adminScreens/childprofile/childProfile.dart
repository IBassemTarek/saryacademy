import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/profileInfoModels/childInfoModel.dart';
import 'package:saryacademy/models/profileInfoModels/parentInfoModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/childUID.dart';
import '../../../screens/adminScreens/childprofile/statusInfoSection.dart';
import '../../../services/profileDatabase.dart';
import '../../../shared/addImpDataSection.dart';
import '../../../shared/alertchecker.dart';
import '../../../shared/reportTitleCard.dart';
import '../../../const.dart';
import 'InfoSection.dart';
import 'customAppBar.dart';
import 'saveBotton.dart';
import 'uploadLocalImage.dart';

// ignore: must_be_immutable
class ChildProfile extends StatelessWidget {
  String childName;
  String age;
  String gender;
  String birthday;
  String email;
  String nationality;
  int reportType;
  String phone;
  String address;
  String fatherOcc;
  String matherOcc;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final uid = Provider.of<ChildModel>(context).uid;
    reportType = Provider.of<ChildInfoModel>(context).reportType;
    childName = Provider.of<ChildInfoModel>(context).name;
    age = Provider.of<ChildInfoModel>(context).age;
    gender = Provider.of<ChildInfoModel>(context).gender;
    birthday = Provider.of<ChildInfoModel>(context).birthday;
    email = Provider.of<ChildInfoModel>(context).email;
    nationality = Provider.of<ChildInfoModel>(context).nationality;
    phone = Provider.of<ParentInfoModel>(context).phone;
    address = Provider.of<ParentInfoModel>(context).address;
    fatherOcc = Provider.of<ParentInfoModel>(context).fatherOccup;
    matherOcc = Provider.of<ParentInfoModel>(context).matherOccup;

    alertcheck(context: context);
    return Scaffold(
      backgroundColor: kbackgroundColor.withOpacity(1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: _height * 0.97,
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 0.01897 * _height,
                            ),
                            CustomAppBar(),
                            Container(
                              width: 0.7198 * _width,
                              child: PhotoGetLocal(),
                            ),
                            // Container(
                            //   width: 0.7198 * _width,
                            //   child: InfoSection(
                            //     lable:
                            //         Locales.currentLocale(context).toString() ==
                            //                 "ar"
                            //             ? ["رابط الصورة"]
                            //             : ["Image URL"],
                            //     onClick: [
                            //       (value) {
                            //         photoURL = driveURLTransfer(value);
                            //       }
                            //     ],
                            //     title: "Child Photo",
                            //   ),
                            // ),
                            Container(
                              width: 0.7198 * _width,
                              child: InfoSection(
                                initialData: [
                                  childName,
                                  gender,
                                  birthday,
                                  email,
                                  nationality,
                                  age,
                                ],
                                lable:
                                    Locales.currentLocale(context).toString() ==
                                            "ar"
                                        ? [
                                            "إسم الطفل",
                                            "الجنس",
                                            "تاريخ الميلاد",
                                            "البريد الإليكتروني",
                                            "الجنسية",
                                            "العمر",
                                          ]
                                        : [
                                            "Child Name",
                                            "Gender",
                                            "Date of birth",
                                            "E-mail",
                                            "Nationality",
                                            "age",
                                          ],
                                onClick: [
                                  (value) {
                                    childName = value;
                                  },
                                  (value) {
                                    gender = value;
                                  },
                                  (value) {
                                    birthday = value;
                                  },
                                  (value) {
                                    email = value;
                                  },
                                  (value) {
                                    nationality = value;
                                  },
                                  (value) {
                                    age = value;
                                  },
                                ],
                                title: "Child Info",
                              ),
                            ),
                            StatefulBuilder(
                                builder: (thisLowerContext, innerSetState) {
                              return Container(
                                margin: EdgeInsets.only(top: 10),
                                width: _width * 0.72,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: kGreyColor.withOpacity(1),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      hint: reportType == null
                                          ? Text(
                                              'report type',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  .copyWith(
                                                      color: Colors.black
                                                          .withOpacity(0.5),
                                                      fontSize: 14),
                                            )
                                          : Text(
                                              reportTypes[reportType - 1],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  .copyWith(
                                                      color: Colors.black
                                                          .withOpacity(0.5),
                                                      fontSize: 14),
                                            ),
                                      items: reportTypes.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    fontSize: 14),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (x) {
                                        innerSetState(() => reportType =
                                            reportTypes.indexOf(x) + 1);
                                      },
                                    ),
                                  ),
                                ),
                              );
                            }),
                            SizedBox(
                              height: 0.026018 * _height,
                            ),
                            SaveBotton(
                              smallBotton: false,
                              text: "save",
                              onTap: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                String photoURL =
                                    prefs.getString("profileImage");
                                if (age != null &&
                                    birthday != null &&
                                    email != null &&
                                    gender != null &&
                                    childName != null &&
                                    nationality != null &&
                                    photoURL != null &&
                                    reportType != null &&
                                    reportType <= 4) {
                                  try {
                                    await ProfileDataBaseServices(uid: uid)
                                        .updateUserData(
                                            age: age,
                                            birthday: birthday,
                                            email: email,
                                            gender: gender,
                                            name: childName,
                                            nationality: nationality,
                                            photourl: photoURL,
                                            reportType: reportType,
                                            uid: uid);
                                  } catch (e) {
                                    print(e);
                                  }
                                } else
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: LocaleText(
                                        "enter you Info again and report type between 1 and 3"),
                                  ));
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.0558 * _height,
                      ),
                      Container(
                        width: 0.7198 * _width,
                        child: DetailsListView(
                          initialData: [phone, address, fatherOcc, matherOcc],
                          lable:
                              Locales.currentLocale(context).toString() == "ar"
                                  ? [
                                      "رقم الهاتف",
                                      "العنوان",
                                      "وظيفة الأب",
                                      "وظيفة الأم"
                                    ]
                                  : [
                                      "Phone",
                                      "Address",
                                      "Father`s occupation",
                                      "Mather'`s occupation"
                                    ],
                          onClick: [
                            (value) {
                              print(value);
                              phone = value;
                            },
                            (value) {
                              print(value);
                              address = value;
                            },
                            (value) {
                              print(value);
                              fatherOcc = value;
                            },
                            (value) {
                              print(value);
                              matherOcc = value;
                            },
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.0258 * _height,
                      ),
                      SaveBotton(
                        smallBotton: false,
                        text: "save",
                        onTap: () async {
                          // print(uid);
                          if (address != null &&
                              phone != null &&
                              fatherOcc != null &&
                              matherOcc != null) {
                            try {
                              await ProfileDataBaseServices(uid: uid)
                                  .updateParentData(
                                      address: address,
                                      phone: phone,
                                      fatherOcc: fatherOcc,
                                      matherOcc: matherOcc);
                            } catch (e) {
                              print(e);
                            }
                          } else
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: LocaleText("enter Info again"),
                            ));
                        },
                      ),
                    ],
                  ),
                  Positioned(
                      top: _height * 0.94,
                      left: 0.2705 * _width,
                      child: ReportTitleCard(
                        title: "Parents Info",
                      )),
                ],
              ),
              SizedBox(
                height: 0.036875 * _height,
              ),
              ReportTitleCard(title: "Medical history"),
              SizedBox(
                height: 0.02897 * _height,
              ),
              Directionality(
                  textDirection: TextDirection.ltr,
                  child: StatusInfoSction(
                    title: "Medical history",
                  )),
              SizedBox(
                height: 0.036875 * _height,
              ),
              AddImpDataSection(condition: "Medical history"),
              SizedBox(
                height: 0.036875 * _height,
              ),
              ReportTitleCard(title: "Vaccinations"),
              SizedBox(
                height: 0.02897 * _height,
              ),
              Directionality(
                  textDirection: TextDirection.ltr,
                  child: StatusInfoSction(
                    title: "Vaccinations",
                  )),
              SizedBox(
                height: 0.036875 * _height,
              ),
              AddImpDataSection(
                condition: 'Vaccinations',
              ),
              SizedBox(
                height: 0.036875 * _height,
              ),
              ReportTitleCard(title: "Absence"),
              SizedBox(
                height: 0.02897 * _height,
              ),
              Directionality(
                  textDirection: TextDirection.ltr,
                  child: StatusInfoSction(
                    title: "Absence",
                  )),
              SizedBox(
                height: 0.036875 * _height,
              ),
              AddImpDataSection(
                condition: "Absence",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
