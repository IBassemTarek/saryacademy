import 'package:flutter/material.dart';
import 'package:saryacademy/const.dart';
import 'package:saryacademy/screens/PRS1/PRS1A.dart';
import 'package:saryacademy/screens/PRS1/PRS1E.dart';
import 'package:saryacademy/screens/PRS2/PRS2A.dart';
import 'package:saryacademy/screens/PRS2/PRS2E.dart';
import 'package:saryacademy/screens/ToddlerReport/ToddlerReportE.dart';
import 'package:saryacademy/screens/events/event.dart';
import 'package:saryacademy/screens/gallery/gallery.dart';
import 'package:saryacademy/screens/home/profileCard.dart';
import 'package:saryacademy/screens/home/progressReportCard.dart';
import 'package:saryacademy/shared/pageRouteAnimation.dart';
import '../profile.dart';
import 'eventsCard.dart';
import 'gallerycard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

       return Scaffold(
        floatingActionButton: InkWell(
        child: Stack(
          alignment: Alignment.bottomRight,
        children: [
            Container(
              margin: EdgeInsets.only(bottom: 0.0039*_height),
            padding: EdgeInsets.only(right: 0.033482*_height,top: 0.0121*_width,bottom: 0.0121*_width,left: 0.063482*_height),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30) ),
            color: Colors.white,
            ),
              child:Text("Alert",style: Theme.of(context).textTheme.headline1.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 36)),
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
    InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: PRCard(),
      onTap: (){ 
      Navigator.push(
      context,
      OnBoardingPageRoute(
      duration: 600,
      // widget: ToddlerReportE(),
      widget: ToddlerReportE(),
      myAnimation: Curves.easeInOut),
      );
      },
      ),
    SizedBox(height: 0.050732*_height,),
    InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: GalleryCard(imageURL1: 'assets/images/home/home31.png',imageURL2: 'assets/images/home/home32.png',imageURL3: 'assets/images/home/home33.png',),
      onTap: (){
      // Navigator.push(
      // context,
      // OnBoardingPageRoute(
      // duration: 600,
      // widget: Gallery(),
      // myAnimation: Curves.easeInOut),
      // );
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