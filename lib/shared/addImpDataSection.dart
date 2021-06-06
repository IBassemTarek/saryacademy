import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/childUID.dart';
import 'package:saryacademy/screens/adminScreens/childprofile/saveBotton.dart';
import 'package:saryacademy/services/profileDatabase.dart';
import 'package:saryacademy/shared/titleTextField.dart';

import 'adminCustomTextField.dart';

// ignore: must_be_immutable
class AddImpDataSection extends StatelessWidget {
  final String condition;
  AddImpDataSection({this.condition});
  String title;
  String descreption;
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final uid = Provider.of<ChildModel>(context).uid;
    return Container(
      width: 0.90338 * _width,
      height: 0.2322 * _height,
      padding: EdgeInsets.symmetric(
        horizontal: 0.05555 * _width,
        vertical: 0.020089 * _height,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: _height * 0.043,
            child: TitleTextField(
              lableText: "Title",
              onClick: (value) {
                title = value;
              },
            ),
          ),
          SizedBox(
            height: _height * 0.016,
          ),
          Container(
            height: _height * 0.0904,
            child: AdminTextField(
              maxLines: 2,
              lableText: "Description",
              onClick: (value) {
                descreption = value;
              },
            ),
          ),
          SizedBox(
            height: 0.011162 * _height,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SaveBotton(
                smallBotton: true,
                text: "add",
                onTap: () {
                  if (descreption != null && title != null) {
                    if (condition == "Medical history")
                      ProfileDataBaseServices(uid: uid)
                          .addNewMedicalData(note: descreption, symptom: title);
                    else if (condition == 'Vaccinations')
                      ProfileDataBaseServices(uid: uid).addNewVaccinationData(
                          date: descreption, vaccination: title);
                    else
                      ProfileDataBaseServices(uid: uid)
                          .addNewAbsenceData(days: descreption, month: title);
                  } else
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("enter you Info again"),
                    ));
                }),
          )
        ],
      ),
    );
  }
}
