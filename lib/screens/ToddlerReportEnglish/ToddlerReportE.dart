import 'package:flutter/material.dart';
import 'package:saryacademy/shared/backArrowBotton.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../const.dart';
import 'checkIcon.dart';
import 'infoCard.dart';
import 'notesAndActivities.dart';

class ToddlerReportE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kbackgroundColor.withOpacity(1),
      appBar: AppBar(
        leading: BackArrowBotton(),
        centerTitle: false,
        titleSpacing: 0,
        elevation:0,
        backgroundColor: Colors.transparent,
        title: Text("Progress Report",style: Theme.of(context).textTheme.headline1.copyWith( color:kIconColor.withOpacity(1),fontSize: 36)),
      ),
      body: Stack(
          alignment: Alignment.center,
          children: [
      Align(
        alignment: Alignment.topRight,
        child: Image.asset("assets/images/PR/PRdec1.png")),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0483092*_width ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 0.0483092*_width ,vertical: 0.02*_height),
          height:0.78125*_height,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40) ),
          color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("Jana`s Report",style: Theme.of(context).textTheme.headline1.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 22)),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(0.00558*_height),
                        decoration: roundedContainer(color: Colors.white,radius: 20.0),
                        child: Text("English",style: Theme.of(context).textTheme.headline1.copyWith( color:kText2Color.withOpacity(1),fontSize: 12)),
                      ),
                      SizedBox(width: 0.036232*_width,),
                        Container(
                        padding: EdgeInsets.all(0.00558*_height),
                        decoration: roundedContainer(color: Colors.white,radius: 5.0),
                        child: SvgPicture.asset('assets/images/PR/pdf.svg',height:0.017161*_height),
                      ),
                      SizedBox(width:0.05*_width),
                    ],
                  )
                ],
              ),
              // SizedBox(height:0.01*_height),
              Row(
                children: [
                    SvgPicture.asset('assets/images/PR/calendar.svg',height:0.0279*_height),
                    SizedBox(width: 0.038647*_width,),
                    Row(
                      children: [
                         CheckIcon(checked: true,),
                         SizedBox(width: 0.03*_width,),
                         Text("Presence",style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText4Color.withOpacity(1),fontSize: 12)),
                         SizedBox(width: 0.02898551*_width,),
                         CheckIcon(checked: false,),
                         SizedBox(width: 0.03*_width,),
                         Text("Absence",style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText4Color.withOpacity(1),fontSize: 12)),
                         SizedBox(width: 0.05*_width,),
                         Text("24 May 2021",style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText2Color.withOpacity(1),fontSize: 12)),
                      ],
                    ),
                ],
              ),
              //  SizedBox(height: 0.011161*_height,),
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
                                        if (mood == i)
                                        {
                                          return Row(children: [
                                              CheckIcon(checked: true,),
                                              SizedBox(width: 10,),
                                              Icon(moods[i],color: kText4Color.withOpacity(1),size: 0.0234375*_height,),
                                          ],); 
                                        }
                                        else {
                                          return Row(children: [
                                              CheckIcon(checked: false,),
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
                          // SizedBox(height:0.0167411 ,),
                          Container(
                            width: 0.5386473*_width,
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [//,this.,this.description,this.
                            SizedBox(width:0.02898551*_width),
                            InfoCard(iconUrl:"assets/images/PR/nap.svg",title:"Nap",description:napsList,done:napsCheck),
                            Container(color:kGreyColor.withOpacity(1),height: 0.0747767857*_height,width: 1,),
                            InfoCard(iconUrl:"assets/images/PR/Meals.svg",title:"Meals",description:mealsList,done:napsCheck),
                          ],
                        )
                        ],
                      ),

                 ),

                //  SizedBox(height: 0.0167411*_height,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Container(
                       height: 0.1015625*_height,
                       width:0.38405797*_width ,
                       decoration: roundedContainer(color: Colors.white,radius: 20.0),
                       child: InfoCard(iconUrl:"assets/images/PR/Fluid.svg",title:"Fluid",description:fluidList,done:napsCheck)),
                       Spacer(),
                       Container(
                       height: 0.1015625*_height,
                       width:0.38405797*_width ,
                       decoration: roundedContainer(color: Colors.white,radius: 20.0),
                       child: InfoCard(iconUrl:"assets/images/PR/Diaper.svg",title:"Diaper",description:napsList,done:napsCheck)),
                   ],
                 ),



                //  SizedBox(height: 0.0167411*_height,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Container(
                       height: 0.1015625*_height,
                       width:0.38405797*_width ,
                       decoration: roundedContainer(color: Colors.white,radius: 20.0),
                       child: InfoCard(iconUrl:"assets/images/PR/Restroom.svg",title:"Restroom",description:restroom,done:napsCheck)),
                       Spacer(),
                       Container(
                       height: 0.1015625*_height,
                       width:0.38405797*_width ,
                       decoration: roundedContainer(color: Colors.white,radius: 20.0),
                       child: InfoCard(iconUrl:"assets/images/PR/Clothes.svg",title:"Clothes",description:napsList,done:napsCheck)),
                   ],
                 ),

                //  SizedBox(height: 0.0167411*_height,),

                 NotesAndActivities(cardIcon: "assets/images/PR/Activities.svg",content:activitiesList, title: "Activities",),

                //  SizedBox(height: 0.0167411*_height,),

                 NotesAndActivities(cardIcon: "assets/images/PR/Notes.svg",content:activitiesList, title: "Notes",),
            ],
          ),
        ),
      )
          ],
        ),
    );
  }
}

