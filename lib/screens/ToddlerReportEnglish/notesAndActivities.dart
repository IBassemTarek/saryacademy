import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../const.dart';


class NotesAndActivities extends StatelessWidget {
  String title;
  String cardIcon;
  List<String> content;

  NotesAndActivities({this.cardIcon,this.content,this.title});

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
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
                                 Text(content[i],style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText4Color.withOpacity(1),fontSize: 11)),
                             ],); 

                         }, 
                         separatorBuilder:  (context,i)=>  SizedBox(width:0.0531401*_width,), 
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