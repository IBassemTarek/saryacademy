import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/childUID.dart';
import 'package:saryacademy/models/profileInfoModels/childInfoModel.dart';
import 'package:saryacademy/shared/loading.dart';


import '../../../const.dart';

class AdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final uid = Provider.of<ChildModel>(context).uid;
    print(uid);
    return Scaffold(
      backgroundColor: kbackgroundColor.withOpacity(1),
      body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
                          CatDataCard(cardName: "Profile",ontap: (){}),
                           Consumer<ChildInfoModel>(
                             // ignore: missing_return
                             builder: (context,childInfo,_) {
                              if (childInfo.reportType == 1 )
                               return CatDataCard(cardName: "Toddler Report",
                                ontap: (){
                              // Navigator.push(
                              // context,
                              // OnBoardingPageRoute(
                              // duration: 600,
                              // widget: ToddlerReportE(),
                              // myAnimation: Curves.easeInOut),
                              //   );
                                }
                                );


                              else if (childInfo.reportType == 2)
                               return CatDataCard(cardName: "Preschool S1",
                                ontap: (){
                              // Navigator.push(
                              // context,
                              // OnBoardingPageRoute(
                              // duration: 600,
                              // widget: PRS1E(),
                              // myAnimation: Curves.easeInOut),
                              //   );
                                }
                                );

                              else if (childInfo.reportType == 3)
                               return CatDataCard(cardName: "Preschool S2",
                                ontap: (){
                              // Navigator.push(
                              // context,
                              // OnBoardingPageRoute(
                              // duration: 600,
                              // widget: PRS2E(),
                              // myAnimation: Curves.easeInOut),
                              //   );
                              }   
                               );
                              else 
                              Container(
                                height: 0.0948*_height,
                                width: 0.9034*_width,
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10) ),
                                color: Colors.white,),
                                child:Loading(),
                                );
                             }
                            ),
                            CatDataCard(cardName: "Events",ontap: (){}),
                             CatDataCard(cardName: "Gallery",ontap: (){}),
                             CatDataCard(cardName: "Alerts",ontap: (){}),
          ],
        ),
      ),
      
    );
  }
}

class CatDataCard extends StatelessWidget {
  final String cardName;
  final Function ontap;
  CatDataCard({this.cardName,this.ontap}); 
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Center(
      child: InkWell(
            onTap:ontap,
            child: Container(
              height: 0.0948*_height,
              width: 0.9034*_width,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10) ),
              color: Colors.white,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(cardName,style: Theme.of(context).textTheme.headline1.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 34)),
                  Icon(Icons.arrow_forward_ios,size: 26,color: kText1Color.withOpacity(1)),
                ],
              ),
              ),
      ),
    );
  }
}