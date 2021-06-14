import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/childUID.dart';
import 'package:saryacademy/screens/adminScreens/adminToddlerReport/smallTextField.dart';
import 'package:saryacademy/screens/adminScreens/childprofile/saveBotton.dart'; 
import 'package:saryacademy/services/PRM3Database.dart';

// ignore: must_be_immutable
class NameAlert extends StatelessWidget { 
    String nameA;
    String nameE;
  @override
  Widget build(BuildContext context) { 
    final uid = Provider.of<ChildModel>(context).uid;
    return new AlertDialog(
      title: const Text('Write Child Name',textAlign: TextAlign.center,style:TextStyle(
                fontFamily: "arialRounded",
                fontSize: 21,
                color: Color(0xff041056),
              ),),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[  
          SmallTextField(
            lableText: "English name",
            onClick: (value){ 
              nameE = value;
            },
            maxLines: 1,
          ),
          Divider(),
          SmallTextField(
            lableText: "Arabic name",
            onClick: (value){ 
                nameA = value;
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
            text: "save",
            onTap: (){ 
               if (nameE==null || nameA==null)
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("please enter you data again"),
            ));
              else {
                PRM3DataBaseServices(uid: uid).updateprNameA(name:nameA );
                PRM3DataBaseServices(uid: uid).updateprNameE(name:nameE );
              }
             Navigator.of(context).pop();
            },
          ),
        )
      ],
 
    );
  }
}