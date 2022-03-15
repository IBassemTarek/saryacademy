import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../const.dart';
import '../../../models/childUID.dart';
import '../../../services/profileDatabase.dart';

class AdminCardOfInfo extends StatelessWidget {
  final String cardType;

  final String title;
  final String subtitle;
  AdminCardOfInfo({
    this.title,
    this.subtitle,
    @required this.cardType,
  }) : assert(title != null);
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.06 * _width,
      ),
      alignment: Alignment.centerLeft,
      height: 0.0747767857 * _height,
      width: 0.90338 * _width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: kText2Color.withOpacity(1), fontSize: 18),
              ),
              Text(
                subtitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: kText3Color.withOpacity(1), fontSize: 14),
              ),
            ],
          ),
          InkWell(
              onTap: () async {
                final childUser =
                    Provider.of<ChildModel>(context, listen: false).uid;
                if (cardType == "Medical history")
                  await ProfileDataBaseServices()
                      .deleteMedicalData(subtitle + title, childUser);
                else if (cardType == "absence")
                  ProfileDataBaseServices()
                      .deleteAbsenceData(subtitle + title, childUser);
                else if (cardType == "Vaccinations")
                  ProfileDataBaseServices()
                      .deleteVaccinationData(subtitle + title, childUser);
              },
              child: Icon(
                Icons.delete_forever,
                color: kText2Color.withOpacity(1),
                size: 0.028 * _height,
              )),
        ],
      ),
    );
  }
}
