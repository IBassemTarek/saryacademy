import 'package:flutter/material.dart'; 


import '../../../screens/adminScreens/adminToddlerReport/smallTextField.dart';
import '../../../screens/adminScreens/childprofile/saveBotton.dart';
import '../../../services/auth.dart';  

// ignore: must_be_immutable
class SignUpAlert extends StatelessWidget { 
  String email;
  String password;
  final bool add;
  SignUpAlert({this.add});
  @override
  Widget build(BuildContext context) {  
    final _auth = AuthService();
    return new AlertDialog(
      title: Text(add?'New Account Info':'Confirm that you need delete this account',textAlign: TextAlign.center,style:TextStyle(
                fontFamily: "arialRounded",
                fontSize: 21,
                color: Color(0xff041056),
              ),),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[  
          SmallTextField(
            lableText: "Email",
            onClick: (value){
              email = value;
            },
            maxLines: 1,
          ),
          Divider(),
          SmallTextField(
            lableText: "Password",
            onClick: (value){
              password = value;
            },
            maxLines: 1,
          )
          ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right:15.0,bottom: 10),
          child: SaveBotton(
            smallBotton: true,
            text: add?"Signup":'delete',
            onTap: ()async{ 
              if (add == true)
              {
                  try{
                    dynamic userData = await _auth.signUp(emailSignIn: email, passwordSignIn: password); 
                  }catch (e) { 
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(e.message),
            ));
          }
              }
              else {
                await _auth.deleteUser(email: email,password: password);
              }
            Navigator.of(context).pop();
                  
            },
          ),
        )
      ],
    );
  }
}