import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/const.dart';
import 'package:saryacademy/models/profileInfoModels/childInfoModel.dart';
import 'package:saryacademy/models/user.dart';
import 'package:saryacademy/screens/PRS1/PRS1E.dart';
import 'package:saryacademy/screens/PRS2/PRS2E.dart';
import 'package:saryacademy/screens/ToddlerReport/ToddlerReportE.dart';
import 'package:saryacademy/screens/events/event.dart';
import 'package:saryacademy/screens/gallery/gallery.dart';
import 'package:saryacademy/screens/home/profileCard.dart';
import 'package:saryacademy/screens/home/progressReportCard.dart';
import 'package:saryacademy/services/adminServices/adminAlertDatbase.dart';
import 'package:saryacademy/shared/loading.dart';
import 'package:saryacademy/shared/pageRouteAnimation.dart';
import '../profile.dart';
import 'eventsCard.dart';
import 'gallerycard.dart';
class HomePage extends StatelessWidget {
Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Alert',textAlign: TextAlign.center,style:TextStyle(
              fontFamily: "arialRounded",
              fontSize: 34,
              color: Color(0xff041056),
            ),),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Text("Would you like your child's current supervisor to contact you?",textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText3Color.withOpacity(1),fontSize: 15))),
      ],
    ),
    actions: <Widget>[
      new InkWell(
        onTap: () {
          AdminAlertDataBaseServices().updateAlertData(
            dateTime: Timestamp.fromDate(DateTime.now()),
            day: DateTime.now().day,
            month: DateTime.now().month,
            name: Provider.of<ChildInfoModel>(context,listen: false).name,
            showed: false,
            uid: Provider.of<UserModel>(context,listen: false).id,
            year: DateTime.now().year,
          );
          Navigator.of(context).pop();
        },
        child: Container(
          padding: EdgeInsets.all(10),
          child: const Text('Yes',style: TextStyle(
              fontFamily: "arialRounded",
              fontSize: 16,
              color: Color(0xff1C9CD8),
            ),)),
      ),
      new InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          padding: EdgeInsets.all(10),
          child: const Text('May be later',style: TextStyle(
              fontFamily: "arialRounded",
              fontSize: 16,
              color: Color(0xff1C9CD8),
            ))),
      ),
    ],
  );
}
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
       return Scaffold(
        floatingActionButton: InkWell(
        child: Stack(
          alignment: Alignment.bottomRight,
        children: [
            InkWell(
              onTap: (){
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context),
            );
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 0.0039*_height),
              padding: EdgeInsets.only(right: 0.033482*_height,top: 0.0121*_width,bottom: 0.0121*_width,left: 0.063482*_height),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30) ),
              color: Colors.white,
              ),
                child:Text("Alert",style: Theme.of(context).textTheme.headline1.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 36)),
              ),
            ),
            // SizedBox(height: 0.927*_height),
            Row(
              mainAxisAlignment:MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius:0.03625*_height,
                  backgroundColor:  kText1Color.withOpacity(1),
                  child: Icon(Icons.phone_in_talk,size: 0.039*_height,color: Colors.white)),
              SizedBox(width:114),
              ],
            )
        ],
      ),
          ),
        
        backgroundColor: kbackgroundColor.withOpacity(1),
        body: Stack(
      children: [
        Positioned(
    top: _height*0.1216517857,
    right: 0,
    child: Image.asset('assets/images/home/home1.png',width: 0.094866*_height,height:0.094866*_height)
    ),
        Align(
    alignment: Alignment.centerLeft,
    child: Image.asset('assets/images/home/home2.png',width: 0.27483*_width,height:0.2109375*_height)
    ),
        Align(
    alignment: Alignment.bottomLeft,
    child: Image.asset('assets/images/home/home3.png',height:0.2*_height)
    ),
        Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
    SizedBox(height: 0.12285714*_height,),
    InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Builder(
        builder: (BuildContext context) =>ProfileCard()),
      onTap: (){
      Navigator.push(
      context,
      OnBoardingPageRoute(
      duration: 600,
      widget: Profile(),
      myAnimation: Curves.easeInOut),);
      },
    ),
    SizedBox(height: 0.0391*_height,),
    Consumer<ChildInfoModel>(
          builder: (context,childInfo,widget) 
        {
        if (childInfo.reportType == null )
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
        return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: PRCard(),
        onTap: (){
          if (childInfo.reportType == 1 )
        Navigator.push(
        context,
        OnBoardingPageRoute(
        duration: 600,
        widget: ToddlerReportE(),
        myAnimation: Curves.easeInOut),
        );
        else if (childInfo.reportType == 2)
        Navigator.push(
        context,
        OnBoardingPageRoute(
        duration: 600,
        widget: PRS1E(),
        myAnimation: Curves.easeInOut),
        );
        else if (childInfo.reportType == 3)
        Navigator.push(
        context,
        OnBoardingPageRoute(
        duration: 600,
        widget: PRS2E(),
        myAnimation: Curves.easeInOut),
        );
        },
        );}
    ),
    SizedBox(height: 0.050732*_height,),
    InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: GalleryCard(imageURL1: 'assets/images/home/home31.png',imageURL2: 'assets/images/home/home32.png',imageURL3: 'assets/images/home/home33.png',),
      onTap: (){
      Navigator.push(
      context,
      OnBoardingPageRoute(
      duration: 600,
      widget: Gallery(),
      myAnimation: Curves.easeInOut),
      );
      },
      ),
    SizedBox(height: 0.03542857*_height,),
    InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: EventsCard(),
      onTap: (){
      Navigator.push(
      context,
      OnBoardingPageRoute(
      duration: 600,
      widget: EventsPage(),
      myAnimation: Curves.easeInOut),
       );
      },
    )
        ],
        )
      ],
    ),
      );
      
  }
}