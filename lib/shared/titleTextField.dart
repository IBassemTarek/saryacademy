
import 'package:flutter/material.dart';

import '../const.dart';


class TitleTextField extends StatelessWidget {
  final String lableText;
  final Function onClick;

  TitleTextField({@required this.onClick,@required this.lableText});
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onClick,
      style: Theme.of(context).textTheme.subtitle1.copyWith( color:kText2Color.withOpacity(1), fontSize: 18 ),
       textAlign: TextAlign.left,
       decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kGreyColor.withOpacity(1),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
       focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kGreyColor.withOpacity(1),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ), 
       labelText: lableText,
      //  hintStyle: Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.black.withOpacity(0.5), fontSize: 14 ),
       labelStyle:Theme.of(context).textTheme.subtitle1.copyWith( color:kText2Color.withOpacity(1), fontSize: 18 ),

       ),
       obscureText: lableText == 'Password'?true:false,
      //  onChanged: (value){},
       );
  }
}