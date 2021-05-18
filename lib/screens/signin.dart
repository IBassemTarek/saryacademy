import 'package:flutter/material.dart';
import 'package:saryacademy/const.dart';
import 'package:saryacademy/screens/profile.dart';
import 'package:saryacademy/shared/pageRouteAnimation.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
              child: Column(
          children: [
            Container(
            height: 0.43998*_height,
            width: _width,
            decoration: new BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20) ,bottomRight: Radius.circular(20)),
            gradient: new LinearGradient(
                colors: [
                  kGradColor1.withOpacity(1),
                  kGradColor2.withOpacity(1),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0,1.0),
                  // begin: Alignment.topRight,
                  // end: Alignment.bottomLeft,
                stops: [0.3, 1.0],
                tileMode: TileMode.clamp),
                ),
              child: Column(
                children: [
                  SizedBox(
                    height:_height*0.0971,
                  ),
                  Image.asset(
                    "assets/images/landingScreen/landing 1.png",
                     height:0.17299*_height,
                     width: 0.4589372*_width,
              ),
                  SizedBox(
                    height:_height*0.046875,
                  ),
              Row(
                children: [
                  SizedBox(
                    width:_width*0.1207721,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello",style: Theme.of(context).textTheme.headline1.copyWith( color:kHeaderColor.withOpacity(1),fontSize: 36)),
                      SizedBox(
                        height:_height*0.02232143,
                      ),
                      Text("Sign In to your account",style: Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.white )),
                    ],
                  )
                ],
              )
                ],
              ),
            ),
            SizedBox(
              height: 0.0725446*_height,
            ),
             Container(
               width: _width*0.758454,
               height: 0.068080*_height,
               child: TextField(
                 style: Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.black, fontSize: 18 ),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                  labelText: 'Email address',
                  labelStyle: Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.black.withOpacity(0.5), fontSize: 14 )
                  ),
                  onChanged: (value){},
                  ),
             ),
            SizedBox(
              height:0.049107*_height,
            ),
             Container(
               width: _width*0.758454,
               height: 0.068080*_height,
               child: TextField(
                 style: Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.black, fontSize: 18 ),
                  decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.black.withOpacity(0.5), fontSize: 14 )
                  ),
                  onChanged: (value){},
                  obscureText: true,
                  ),
             ),
            SizedBox(
              height:0.1886*_height,
            ),
             InkWell(
               onTap: (){
          Navigator.pushAndRemoveUntil(
          context,
          OnBoardingPageRoute(
          duration: 1000,
          widget: Profile(),
          myAnimation: Curves.elasticInOut),
            (route) => false);
          },
                            child: Container(
                 alignment: Alignment.center,
                 width: _width*0.758454,
                 height: 0.068080*_height,
            decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30) ),
            color: kbackgroundColor.withOpacity(1),
                  ),
                  child: Text('Login',style: Theme.of(context).textTheme.headline1.copyWith( color:Colors.white)),
               ),
             )
          ],
        ),
      ),
    );
  }
}