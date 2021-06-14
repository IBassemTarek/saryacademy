import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/childUID.dart';
import 'package:saryacademy/screens/adminScreens/adminToddlerReport/smallTextField.dart';
import 'package:saryacademy/screens/adminScreens/childprofile/saveBotton.dart'; 
import 'package:saryacademy/services/PRM3Database.dart';

// ignore: must_be_immutable
class MounthAlert extends StatelessWidget { 
MounthAlert({this.mounthNo});
    String mounthE;
    String mounthA;
    final int mounthNo;
  @override
  Widget build(BuildContext context) { 

    final uid = Provider.of<ChildModel>(context).uid;
    return new AlertDialog(
      title: const Text('Select mounth',textAlign: TextAlign.center,style:TextStyle(
                fontFamily: "arialRounded",
                fontSize: 21,
                color: Color(0xff041056),
              ),),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[  
          SmallTextField(
            lableText: "English Mounth",
            onClick: (value){
              mounthE = value;
            },
            maxLines: 1,
          ),
          Divider(),
          SmallTextField(
            lableText: "Arabic Mounth",
            onClick: (value){
              mounthA = value;
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
                if (mounthNo == 1 && mounthE!=null && mounthA!=null)
                { 
                    PRM3DataBaseServices(uid: uid).updateprMounth1E(mounth: mounthE);
                    PRM3DataBaseServices(uid: uid).updateprMounth1A(mounth: mounthA);
                }
                    
                else if (mounthNo == 2&& mounthE!=null&& mounthA!=null)
                {
                    PRM3DataBaseServices(uid: uid).updateprMounth2E(mounth: mounthE);
                    PRM3DataBaseServices(uid: uid).updateprMounth2A(mounth: mounthA);
                }
                else if (mounthNo == 3&& mounthE!=null&& mounthA!=null)
                {
                    PRM3DataBaseServices(uid: uid).updateprMounth3E(mounth: mounthE);
                    PRM3DataBaseServices(uid: uid).updateprMounth3A(mounth: mounthA);
                }
                else if (mounthE==null || mounthA==null)
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("please enter you data again"),
            ));
             Navigator.of(context).pop();
            },
          ),
        )
      ],
 
    );
  }
}