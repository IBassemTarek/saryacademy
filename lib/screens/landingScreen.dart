import 'package:flutter/material.dart';


import '../../../const.dart';
import '../../../shared/pageRouteAnimation.dart';
// import '../../../screens/wrapper.dart';
import '../../../screens/signIn/signin.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
        decoration: new BoxDecoration(
        gradient: new LinearGradient(
      colors: [
        kGradColor1.withOpacity(1),
        kGradColor2.withOpacity(1),
      ],
      // begin: const FractionalOffset(0.0, 0.0),
      // end: const FractionalOffset(1.0,1.0),
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      stops: [0.3, 1.0],
      tileMode: TileMode.clamp),
      ),
      child: Column(children: [
        SizedBox(
        height:0.108*_height,
        ),
        Image.asset(
        "assets/images/landingScreen/landing 1.png",
        height:0.22*_height,
        width: 0.5869565*_width,
        ),
        SizedBox(
        height:0.02678571*_height,
        ),
        Image.asset(
        "assets/images/landingScreen/landing 2.png",
        height:0.529*_height,
        width: _width,
        ),
        SizedBox(
        height:0.0357*_height,
        ),
        InkWell(
        onTap: (){
      Navigator.pushAndRemoveUntil(
      context,
      OnBoardingPageRoute(
      duration: 1000,
      widget: SignIn(),
      myAnimation: Curves.elasticInOut),
        (route) => false);
        },
        child: Container(
    height:0.078125*_height,
    // height: *_height,
    alignment: Alignment.center,
    color: kbackgroundColor.withOpacity(1),
    child:Text("Get started",style: Theme.of(context).textTheme.headline1.copyWith( color:Colors.white,fontSize: 24 )),
        )
        )
      ],), 
    ),
      );
  }
}