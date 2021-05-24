import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:saryacademy/const.dart';
import 'package:saryacademy/models/user.dart';
import 'package:saryacademy/provider/modalprogrsshub.dart';
import '../../shared/pageRouteAnimation.dart';
import '../home/home.dart';
import 'customTextField.dart';
import '../../services/auth.dart';
import 'package:provider/provider.dart';


class SignIn extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();  

  final _auth=AuthService();
  
  @override
  Widget build(BuildContext context) {
    String _email,_password;
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        // backgroundColor: kGradColor1.withOpacity(1),
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<ModelHub>(context).isLoading,
                          child: Builder(
                            builder: (context) {
                              return Form(
              key: _globalKey,
     child: ListView(
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
           padding: EdgeInsets.symmetric(horizontal:0.120773*_width ),
               width: _width*0.758454,
              //  height: 0.068080*_height,
               child: CustomTextField(
                 lableText: 'Email address',
                 hintText: "sary@saryacademy.com",
                 onClick: (value){
                   _email = value ;
                 },
                 ),
         ),
        SizedBox(
              height:0.049107*_height,
        ),
         Container(
               padding: EdgeInsets.symmetric(horizontal:0.120773*_width ),
               width: _width*0.758454,
              //  height: 0.068080*_height,
               child: CustomTextField(
                 lableText: 'Password',
                 hintText: "Ss@21062020",
                 onClick: (value){
                   _password = value ;
                 },
                 ), 
         ),
        SizedBox(
              height:0.13800*_height,
        ),
         Builder(
      builder: (context) =>Padding(
        padding: EdgeInsets.symmetric(horizontal:0.120773*_width ),
              child: InkWell(
                   onTap: () async {
                     final modelhub = Provider.of<ModelHub>(context,listen: false);
                     modelhub.changeIsLoading(true);
        if (_globalKey.currentState.validate())
        {
          _globalKey.currentState.save();
                try{
                dynamic userData = await _auth.signIn(_email, _password);
                modelhub.changeIsLoading(false);
                if(userData !=null)
                {
                  UserModel user = _auth.userFromFirebaseUser(userData);
                  print(user.id);
                }
        Navigator.push(
        context,
        OnBoardingPageRoute(
        duration: 1000,
        widget: HomePage(),
        myAnimation: Curves.elasticInOut),
          );
                }catch(e){
                  modelhub.changeIsLoading(false);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message),));
                }

        } 
        modelhub.changeIsLoading(false);       
        },
        child: Container(
          alignment: Alignment.center,
          width: _width*0.758454,
          height: 0.068080*_height,
          decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30) ),
          color: kbackgroundColor.withOpacity(1),
                           ),
                      child: Text('Login',style: Theme.of(context).textTheme.headline1.copyWith( color:Colors.white,fontSize: 24)),
                   ),
               ),
      ),
         ),
         SizedBox(height: 0.01116*_height,),
         Center(child: Text('login as admin',style: Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.black, fontSize: 10 ),)),
      ],
    ),
            );
                            }
                          ),
          ),
      );
  }
}