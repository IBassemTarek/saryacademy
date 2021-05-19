import 'package:flutter/material.dart';
import 'package:saryacademy/shared/backArrowBotton.dart';
import 'package:saryacademy/shared/infoTable.dart';
import 'package:saryacademy/shared/profilePhoto.dart';
import 'package:saryacademy/shared/statusInfo.dart';
import '../const.dart';
import '../shared/titleCard.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kbackgroundColor.withOpacity(1),
      body: SafeArea(
              child: SingleChildScrollView(
                              child: Column(
                  children: [ 
                    Stack(
                      children: [
   Container(
                          height: _height*0.27455,
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(
                              height:0.01897*_height,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              SizedBox (
                                width: _width*0.05314,
                              ),
                              BackArrowBotton(),
                            SizedBox(
                              width:0.2374396*_width,
                            ),
                            ProfilePhoto(photoUrl:'assets/images/profile/profile.png',sizedRatio:0.1251875),
                            ],),
                            SizedBox(
                              height:0.0123*_height,
                            ),
                            Text('Jana Tarek',style: Theme.of(context).textTheme.headline1.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 36)),
                            SizedBox(
                              height:0.0078*_height,
                            ),
                            Text('5 Years',style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText1Color.withOpacity(1),fontSize: 18)),
                          ],
                        ),
        ),
          Align(
            alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 0.253*_height,
                            ),
TitleCard(title: "Child Info",),],
                        ),
          ),


                      ],
                    ),
                SizedBox(
                  height:0.01897*_height,
                ),
                InfoTable(x1y1:'Gender' ,x2y1:'Birthday',x3y1:'E-mail' ,x4y1:'Nationality',
                x1y2:'Female',x2y2:'13 Dec 2020',x3y2:'sary@gmail.com' ,x4y2:'Egyptian',
                ),
                SizedBox(
                  height:0.035714*_height,
                ),
                  TitleCard(title: "Parents Info",),
                SizedBox(
                  height:0.03125*_height,
                ),
                InfoTable(x1y1:'Phone' ,x2y1:'Address',x3y1:'Father`s occupation' ,x4y1:'Mather`s occupation',
                x1y2:'01211185562',x2y2:'Bigtown',x3y2:'enginner' ,x4y2:'Architect',
                ),
                SizedBox(
                  height:0.04799*_height,
                ),
                StatusInfo(title: 'Medical history',),
                SizedBox(
                  height:0.03125*_height,
                ),
                StatusInfo(title: 'Vaccinations',),
                SizedBox(
                  height:0.03125*_height,
                ),
                StatusInfo(title: 'Absence',),
                SizedBox(
                  height:0.066964*_height,
                ),
                  ],
                ),
              ),
      ),
    );
  }
}

