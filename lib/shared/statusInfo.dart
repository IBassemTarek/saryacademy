import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import '../models/profileInfoModels/medicalHistoryModel.dart';
import '../const.dart';
import '../shared/cardOfInfo.dart';
import '../models/profileInfoModels/absenceModel.dart';
import '../models/profileInfoModels/vaccinationModel.dart';
import 'loading.dart';
class StatusInfo extends StatelessWidget {
  final String title;
  StatusInfo({this.title}):assert(title!=null);
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final medicalHistoryCard = Provider.of<List<MedicalHistoryCard>>(context);
    final vaccinationCard = Provider.of<List<VaccinationCard>>(context);
    final absenceCard = Provider.of<List<AbsenceCard>>(context);
    return Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 0.05797*_width,),
                          LocaleText(title,style:Theme.of(context).textTheme.headline1.copyWith( color:kHeaderColor.withOpacity(1),fontSize: 30) ,),
                        ],
                      ),
                SizedBox(
                  height:0.01897*_height,
                ),
                      Builder(
                        builder: (context) {
if (( medicalHistoryCard.isEmpty&&title == "Medical history") ||  (vaccinationCard.isEmpty &&title == "Medical history") || ( absenceCard.isEmpty&&title == "Medical history") )
    return Container(
          
          decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10) ),
          color: Colors.white,
          ),
          height: 0.12*_height,
          width: 0.90338*_width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text("No $title setted yet",style:Theme.of(context).textTheme.headline1.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 23) ,textAlign: TextAlign.center,)),
          ),
     );
if (( medicalHistoryCard==null&&title == "Medical history") ||  (vaccinationCard==null &&title == 'Vaccinations') || ( absenceCard==null&&title == 'Absence') )
    return Container(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10) ),
          color: Colors.white,
          ),
          height: 0.13392857*_height,
          width: 0.90338*_width,
          child: Loading(),
     );
    else 
                          return Container(
                            width: 0.90338*_width,
                            child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap:true,
                              itemCount: 
                              (() {
      if(title == "Medical history")
        return medicalHistoryCard.length;
      else if(title == 'Vaccinations')
        return vaccinationCard.length;
      return absenceCard.length;
    })(),
                              separatorBuilder: (context,i)=>  SizedBox(height:0.01897*_height,),
                              itemBuilder: (context,i)=>
     (() {
      if(title == "Medical history")
        return  CardOfInfo(title:medicalHistoryCard[i].symptom ,subtitle:medicalHistoryCard[i].note);
      else if(title == 'Vaccinations')
        return CardOfInfo(title:vaccinationCard[i].vaccination ,subtitle:vaccinationCard[i].date);
      return CardOfInfo(title:absenceCard[i].month ,subtitle:absenceCard[i].days);
    })(),
                              
                              

                            ),
                          );
                        }
                      ),
                    ],
                  );
  }
}