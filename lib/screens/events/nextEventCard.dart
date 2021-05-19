import 'package:flutter/material.dart';
import 'package:saryacademy/models/eventModel.dart';

import '../../const.dart';
class NextEventCard extends StatelessWidget {
  int index;
  NextEventCard({this.index});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Container(
          // padding: EdgeInsets.symmetric(horizontal: 0.0483092*_width ,vertical: 0.01*_height),
          height:0.3359375*_height,
          width: 0.83575*_width,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40) ),
          color:Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(0.02451*_height),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(eventCardTest[index].title,style: Theme.of(context).textTheme.subtitle1.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 18))),
                Container(
                  height:0.1875*_height,
                  width:0.768116*_width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10) ),
                  ),
                  child:Image.asset(eventCardTest[index].imageURL),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(eventCardTest[index].text,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText3Color.withOpacity(1),fontSize: 10))),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(eventCardTest[index].date,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText2Color.withOpacity(1),fontSize: 14))),
              ],
            ),
          ),
    );
  }
}