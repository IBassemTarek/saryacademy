import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/profileInfoModels/childInfoModel.dart';
import 'package:saryacademy/models/profileInfoModels/parentInfoModel.dart';
import 'package:saryacademy/screens/signIn/signin.dart';
import 'package:saryacademy/shared/backArrowBotton.dart';
import 'package:saryacademy/shared/infoTable.dart';
import 'package:saryacademy/shared/loading.dart';
import 'package:saryacademy/shared/pageRouteAnimation.dart';
import 'package:saryacademy/shared/profilePhoto.dart';
import 'package:saryacademy/shared/statusInfo.dart';
import '../const.dart';
import '../shared/titleCard.dart';
import '../services/auth.dart';
class Profile extends StatelessWidget {
  final _auth=AuthService();
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
          return  Consumer<ParentInfoModel>(
            builder:  (_,parentInfo,__){
            if (parentInfo == null || parentInfo.fatherOccup == null || parentInfo.matherOccup == null|| parentInfo.phone == null )
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
              return Consumer<ChildInfoModel>(
            builder:  (_,childInfo,__){
            if (childInfo.age == null || childInfo.birthday == null || childInfo.email == null || childInfo.gender == null || childInfo.name == null || childInfo.nationality == null || childInfo.photourl == null)
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
                            ProfilePhoto(sizedRatio:0.1251875),
                            SizedBox(
                              width:0.1374396*_width,
                            ),
                            Container(
                              padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10) ),
                    color:  kText1Color.withOpacity(1)
                    ),
                              child: InkWell(
                                onTap: () async {
                                  await _auth.signOut();
                                  Navigator.pushAndRemoveUntil(
                                  context,
                                  OnBoardingPageRoute(
                                  duration: 1000,
                                  widget: SignIn(),
                                  myAnimation: Curves.elasticInOut),
                                    (route) => false);
                                },
                                child: Text('sign out',style:Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.white,fontSize: 14))),
                              ),
                              
                            ],),
                            SizedBox(
                              height:0.0123*_height,
                            ),
                            Consumer<ChildInfoModel>(
  builder: (_,childInfo,__) =>   Text(childInfo.name,style: Theme.of(context).textTheme.headline1.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 36))),
                            SizedBox(
                              height:0.0078*_height,
                            ),
                           Consumer<ChildInfoModel>(
  builder: (_,childInfo,__) =>   Text(childInfo.age,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText1Color.withOpacity(1),fontSize: 18)),)
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
                                       Consumer<ChildInfoModel>(
  builder: (_,childInfo,__) =>  InfoTable(x1y1:'Gender' ,x2y1:'Birthday',x3y1:'E-mail' ,x4y1:'Nationality',
                  x1y2:childInfo.gender,x2y2:childInfo.birthday,x3y2:childInfo.email,x4y2:childInfo.nationality,
                  ),
                ),
                SizedBox(
                  height:0.035714*_height,
                ),
                  TitleCard(title: "Parents Info",),
                SizedBox(
                  height:0.03125*_height,
                ),
                                                   Consumer<ParentInfoModel>(
  builder: (_,parentInfo,__) =>  InfoTable(x1y1:'Phone' ,x2y1:'Address',x3y1:'Father`s occupation' ,x4y1:'Mather`s occupation',
                  x1y2:parentInfo.phone,x2y2:parentInfo.address,x3y2:parentInfo.fatherOccup ,x4y2:parentInfo.matherOccup,
                  ),
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
        );}
    );
            }
          );
  }
}

