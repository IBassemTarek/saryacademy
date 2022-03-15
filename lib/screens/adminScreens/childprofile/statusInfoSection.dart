import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/profileInfoModels/absenceModel.dart';
import '../../../models/profileInfoModels/medicalHistoryModel.dart';
import '../../../models/profileInfoModels/vaccinationModel.dart';
import 'AdminCardInfo.dart';

class StatusInfoSction extends StatelessWidget {
  final String title;
  StatusInfoSction({this.title}) : assert(title != null);
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    List medicalHistoryCard = Provider.of<List<MedicalHistoryCard>>(context);
    List vaccinationCard = Provider.of<List<VaccinationCard>>(context);
    List absenceCard = Provider.of<List<AbsenceCard>>(context);
    // if (medicalHistoryCard.isEmpty ||
    //     vaccinationCard.isEmpty ||
    //     absenceCard.isEmpty)
    //   return Container(
    //       // decoration: BoxDecoration(
    //       // borderRadius: BorderRadius.all(Radius.circular(10) ),
    //       // color: Colors.white,
    //       // ),
    //       // height: 0.13392857*_height,
    //       // width: 0.90338*_width,
    //       // child: Loading(),
    //       );
    // else
    return Column(
      children: [
        Container(
          width: 0.90338 * _width,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: (() {
              if (title == "Medical history")
                return medicalHistoryCard.length;
              else if (title == 'Vaccinations') return vaccinationCard.length;
              return absenceCard.length;
            })(),
            separatorBuilder: (context, i) => SizedBox(
              height: 0.01897 * _height,
            ),
            itemBuilder: (context, i) => (() {
              if (title == "Medical history")
                return AdminCardOfInfo(
                    cardType: "Medical history",
                    title: medicalHistoryCard[i].symptom,
                    subtitle: medicalHistoryCard[i].note);
              else if (title == 'Vaccinations')
                return AdminCardOfInfo(
                    cardType: "Vaccinations",
                    title: vaccinationCard[i].vaccination,
                    subtitle: vaccinationCard[i].date);
              return AdminCardOfInfo(
                  cardType: "absence",
                  title: absenceCard[i].month,
                  subtitle: absenceCard[i].days);
            })(),
          ),
        ),
      ],
    );
  }
}
