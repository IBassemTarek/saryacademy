 
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


import '../../../models/childUID.dart'; 
import '../../../models/progressReportModel1.dart';
import '../../../screens/PRS1/nameAlert.dart';
import '../../../screens/adminScreens/adminToddlerReport/AdminActivitiesAndNotes.dart';
import '../../../screens/adminScreens/adminToddlerReport/adminDatesInfoCard.dart';
import '../../../screens/ToddlerReport/adminInfoCard.dart';
import '../../../screens/ToddlerReport/checkIcon.dart';
import '../../../services/toddlerPRDatabase.dart';  
import '../../../shared/alertchecker.dart';
import '../../../shared/backArrowBotton.dart'; 
import '../../../shared/loading.dart'; 
import '../../../const.dart';
import 'smallTextField.dart'; 
class AdminToddlerReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final prm1ModelData = Provider.of<PRM1model>(context);
    final uid = Provider.of<ChildModel>(context).uid;
    alertcheck(context:context);
    if (prm1ModelData == null || prm1ModelData.activities == null || prm1ModelData.childName == null|| prm1ModelData.clothes == null || 
    prm1ModelData.dateA == null || prm1ModelData.dateE == null || prm1ModelData.diaper == null || prm1ModelData.fluid == null ||
    prm1ModelData.meals == null || prm1ModelData.mood == null || prm1ModelData.naps == null || prm1ModelData.notes == null ||
     prm1ModelData.presence == null || prm1ModelData.restroom == null )
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
    return Scaffold( 
      backgroundColor: kbackgroundColor.withOpacity(1),
      appBar: AppBar(
        leading: BackArrowBotton(),
        centerTitle: false,
        titleSpacing: 0,
        elevation:0,
        backgroundColor: Colors.transparent,
        title: Text("Progress Report",style: Theme.of(context).textTheme.headline1.copyWith( color:kIconColor.withOpacity(1),fontSize: 30)),
      ),
      body: Stack(
          alignment: Alignment.center,
          children: [
      Align(
        alignment: Alignment.topRight,
        child: Image.asset("assets/images/PR/PRdec1.png")),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0483092*_width ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 0.0483092*_width ,vertical: 0.02*_height),
            height:0.78125*_height,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40) ),
            color: Colors.white,
            ),
            child: Wrap(
              runSpacing: _height*0.01,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
      Container(
        width: 0.3771*_width,
        child: FittedBox(
                        child: Text("${prm1ModelData.childName}`s Report",style: Theme.of(context).textTheme.headline1.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 22)))),
                      SizedBox(width: 5,),
                      InkWell(
                        onTap: (){
                          showDialog(
                          context: context,
                          builder: (BuildContext context) => NameAlert(reportType: 1,),
                          );
                        },
                        child: Icon(Icons.edit,size: 15,color: kbackgroundColor.withOpacity(1),)),
                    ],
                  ),
                    Spacer(),
                    Row(
                      children: [
                        Container(
                          height:0.04*_height,width: 110,
                          child: SmallTextField( 
              lableText: "pdf",
              onClick: (value){
                ToddlerPRDataBaseServices().updatePDF(
                  pdf: value,
                  uid: uid,
                );
              },
              maxLines: 1, 
            ),
                        ),
                      ],
                    ),

                    SizedBox(width:0.05*_width)
                  ],
                ), 
                Row(
                  children: [
                      SvgPicture.asset('assets/images/PR/calendar.svg',height:0.0279*_height),
                      SizedBox(width: 0.038647*_width,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           InkWell(
                            onTap: (){ 
                              if (!prm1ModelData.presence)
                              ToddlerPRDataBaseServices().updatePresence(
                                presence: true,
                                uid : uid
                                );
                            },
                             child: Row(
                               children: [
                                 CheckIcon(checked: prm1ModelData.presence,),
                           SizedBox(width: 0.03*_width,),
                           Text("Presence",style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText4Color.withOpacity(1),fontSize: 12)),
                               ],
                             )),

                           SizedBox(width: 0.02898551*_width,),
                           InkWell(
                            onTap: (){ 
                              if (prm1ModelData.presence)
                              ToddlerPRDataBaseServices().updatePresence(presence: false,
                                uid : uid);
                            },
                             child: Row(
                               children: [
                                 CheckIcon(checked: !prm1ModelData.presence,),
                           SizedBox(width: 0.03*_width,),
                           Text("Absence",style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText4Color.withOpacity(1),fontSize: 12)),
                               ],
                             )),
                           SizedBox(width: 0.05*_width,),
      InkWell(
      onTap: () {
          DatePicker.showDatePicker(context,
                                showTitleActions: true,
                            onConfirm: (value) {
                              String dateEnglish = value.day.toString() + " " + dateE[value.month-1] + " " + value.year.toString();
                              String dateArabic = value.day.toString() + " " + dateA[value.month-1] + " " + value.year.toString();
                              print(dateEnglish);
                              print(dateArabic);
                              ToddlerPRDataBaseServices().updateDate( 
                                dateE: dateEnglish,
                                dateA: dateArabic,
                                uid : uid
                                );

                            }, currentTime: DateTime.now(), locale: LocaleType.en);
      },
      child: Container(
        width: 80,
        child: FittedBox(
    fit: BoxFit.scaleDown,child: SizedBox(child: Text(prm1ModelData.dateE,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText2Color.withOpacity(1),fontSize: 12)))),
      ),),  
      ],
                      ),
                  ],
                ),
                  Container(
                        height: 0.19642857*_height,
                        width: 0.835748793*_width,
                        decoration: roundedContainer(color: Colors.white,radius: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // SizedBox(height: 0.01674*_height,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(moods[mood],color: kIconColor.withOpacity(1),size: 0.03348*_height,),
                                SizedBox(width: 0.024155*_width,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Mood",style: Theme.of(context).textTheme.subtitle1.copyWith( color:kText4Color.withOpacity(1),fontSize: 12)),
                                    Container(
                                      height: 0.032366*_height,
                                      width: 0.44927537*_width,
                                      child: ListView.separated(
                                        physics: const NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap:true,
                                        itemBuilder: (context,i) {
                                          if (prm1ModelData.mood == i)
                                          {
                                            return Row(children: [
                                                CheckIcon(checked: true,),
                                                SizedBox(width: 10,),
                                                Icon(moods[i],color: kText4Color.withOpacity(1),size: 0.0234375*_height,),
                                            ],); 
                                          }
                                          else {
                                            return Row(children: [
                                                InkWell(
                                                  onTap: (){
                                                    ToddlerPRDataBaseServices().updateMood(mood: i,uid: uid);
                                                  },
                                                  child: CheckIcon(checked: false,)),
                                                SizedBox(width: 10,),
                                                Icon(moods[i],color: kText4Color.withOpacity(1),size: 0.0234375*_height,),
                                            ],);
                                          }
                                        }, 
                                        separatorBuilder:  (context,i)=>  SizedBox(width:0.0531401*_width,), 
                                        itemCount:  moods.length),
                                    )
                                  ],
                                )
                            ],),
                            Container(
                              width: 0.5386473*_width,
                              child: Divider(
                                thickness: 1,
                              ),
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [//,this.,this.description,this.
                              SizedBox(width:0.02898551*_width),//
                              AdminDatesInfoCard(iconUrl:"assets/images/PR/nap.svg",title:"Nap",description:List.from(prm1ModelData.naps)),
                              Container(color:kGreyColor.withOpacity(1),height: 0.0747767857*_height,width: 1,),
                              AdminInfoCard(iconUrl:"assets/images/PR/Meals.svg",title:"Meals",description:mealsList,done:List.from(prm1ModelData.meals)),
                            ],
                          )
                          ],
                        ),
                   ), 
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Container(
                         height: 0.1015625*_height,
                         width:0.38405797*_width ,
                         decoration: roundedContainer(color: Colors.white,radius: 20.0),
                         child: AdminInfoCard(iconUrl:"assets/images/PR/Fluid.svg",title:"Fluid",description:fluidList,done:List.from(prm1ModelData.fluid))),
                         Spacer(),
                         Container(
                         height: 0.1015625*_height,
                         width:0.38405797*_width ,
                         decoration: roundedContainer(color: Colors.white,radius: 20.0),
                         child: AdminDatesInfoCard(iconUrl:"assets/images/PR/Diaper.svg",title:"Diaper",description:prm1ModelData.diaper)),
                     ],
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Container(
                         height: 0.1015625*_height,
                         width:0.38405797*_width ,
                         decoration: roundedContainer(color: Colors.white,radius: 20.0),
                         child: AdminInfoCard(iconUrl:"assets/images/PR/Restroom.svg",title:"Restroom",description:restroom,done:prm1ModelData.restroom)),
                         Spacer(),
                         Container(
                           
                         height: 0.1015625*_height,
                         width:0.38405797*_width ,
                         decoration: roundedContainer(color: Colors.white,radius: 20.0),
                         child: AdminDatesInfoCard(iconUrl:"assets/images/PR/Clothes.svg",title:"Clothes",description:prm1ModelData.clothes)),
                     ],
                   ),
                   AdminNotesAndActivities(cardIcon: "assets/images/PR/Activities.svg",content:prm1ModelData.activities, title: "Activities",),
                   AdminNotesAndActivities(cardIcon: "assets/images/PR/Notes.svg",content:prm1ModelData.notes, title: "Notes",),
              ],
            ),
          ),
        ),
      )
          ],
        ),
    );
  }
}


