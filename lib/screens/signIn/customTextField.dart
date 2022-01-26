
import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final String lableText;
  final String hintText;
  final Function onClick;

  CustomTextField({@required this.onClick, @required this.hintText,@required this.lableText});
  
  String _errorMessage (String str){
    switch(lableText) 
    {
      case 'Email address' : return 'E-mail is empty !';
      default : return 'Password is empty !';
    }
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // ignore: missing_return
      validator: (value){
        if (value.isEmpty)
        return _errorMessage(lableText);
        else if (lableText == 'Password' && value.length < 6 )
        return 'enter 6+ password';
        // return '';
      },
      onSaved: onClick,
      style: Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.black, fontSize: 18 ),
       textAlign: TextAlign.left,
       decoration: InputDecoration(
       labelText: lableText,
       hintText: hintText,
       hintStyle: Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.black.withOpacity(0.5), fontSize: 14 ),
       labelStyle: Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.black.withOpacity(0.5), fontSize: 14 )
       ),
       obscureText: lableText == 'Password'?true:false,
      //  onChanged: (value){},
       );
  }
}