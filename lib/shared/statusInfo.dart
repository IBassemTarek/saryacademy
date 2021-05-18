import 'package:flutter/material.dart';
import 'package:saryacademy/models/profileInfoModels/medicalHistoryModel.dart';
import '../const.dart';
import 'package:saryacademy/shared/cardOfInfo.dart';
import '../models/profileInfoModels/absenceModel.dart';
import '../models/profileInfoModels/vaccinationModel.dart';
// ignore: must_be_immutable
class StatusInfo extends StatelessWidget {
  String title;
  StatusInfo({this.title}):assert(title!=null);
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 0.05797*_width,),
                          Text(title,style:Theme.of(context).textTheme.headline1.copyWith( color:kHeaderColor.withOpacity(1),fontSize: 30) ,),
                        ],
                      ),
                SizedBox(
                  height:0.01897*_height,
                ),
                      Container(
                        width: 0.90338*_width,
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap:true,
                          itemCount: 
                          (() {
      if(title == "Medical history")
        return medicalHistoryCardTest.length;
      else if(title == 'Vaccinations')
        return vaccinationCardTest.length;
      return absenceCardTest.length;
    })(),
                          separatorBuilder: (context,i)=>  SizedBox(height:0.01897*_height,),
                          itemBuilder: (context,i)=>
     (() {
      if(title == "Medical history")
        return  CardOfInfo(title:medicalHistoryCardTest[i].symptom ,subtitle:medicalHistoryCardTest[i].note);
      else if(title == 'Vaccinations')
        return CardOfInfo(title:vaccinationCardTest[i].vaccination ,subtitle:vaccinationCardTest[i].date);
      return CardOfInfo(title:absenceCardTest[i].month ,subtitle:absenceCardTest[i].days);
    })(),
                          
                          

                        ),
                      ),
                    ],
                  );
  }
}