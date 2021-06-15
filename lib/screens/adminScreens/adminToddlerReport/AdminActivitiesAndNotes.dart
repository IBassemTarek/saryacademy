import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/childUID.dart';
import 'package:saryacademy/services/toddlerPRDatabase.dart';

import '../../../const.dart';


class AdminNotesAndActivities extends StatelessWidget {
  final String title;
  final String cardIcon;
  final List<dynamic> content;

  AdminNotesAndActivities({this.cardIcon,this.content,this.title});

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final uid = Provider.of<ChildModel>(context).uid;
    return Container(
         height: 0.100446*_height,
         width: 0.835748793*_width,
         decoration: roundedContainer(color: Colors.white,radius: 20.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             // SizedBox(height: 0.01674*_height,),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 SizedBox(width: 0.03623188*_width,),
                 SvgPicture.asset(cardIcon,height:0.0390625*_height,),
                 SizedBox(width: 0.024155*_width,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(title,style: Theme.of(context).textTheme.subtitle1.copyWith( color:kText4Color.withOpacity(1),fontSize: 12)),
                     SizedBox(height: 0.008929*_height,),
                     Container(
                       width: 0.628019*_width,
                       child: ListView.separated(
                         physics: const NeverScrollableScrollPhysics(),
                         shrinkWrap:true,
                         itemBuilder: (context,i) {
                             return Row(children: [
                                 Icon(Icons.done_all,color: kText4Color.withOpacity(1),size: 0.015*_height,),
                                 SizedBox(width: 10,), 
                                                Container( 
                                                  height: 18,
                                                  width: 200,
                                                  child: TextField(
                                                    maxLines:1,
                                                    style: Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.blue[300], fontSize: 12 ),
                                                    controller: (content[i]!=null)?(TextEditingController()..text = content[i]):(TextEditingController()..text = ""), 
                                                    onChanged: (value){
                                                     print(value);
                                                     content[i]= value;
                                                     ToddlerPRDataBaseServices().updateNotesAndActivities(
                                                       list: content,
                                                       title: title,
                                                       uid: uid,
                                                     ); 
                                                    }
                                                    ),
                                                )
                             ],); 

                         }, 
                         separatorBuilder:  (context,i)=>  SizedBox(height:0.00531401*_height,), 
                         itemCount:  content.length),
                     )
                   ],
                 )
             ],),
           ],
         ),

    );
  }
}