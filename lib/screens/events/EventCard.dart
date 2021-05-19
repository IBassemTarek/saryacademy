import 'package:flutter/material.dart';
import 'package:saryacademy/models/eventModel.dart';
import 'package:saryacademy/shared/profilePhoto.dart';

import '../../const.dart';
class EventCardWidget extends StatelessWidget {
  int index;
  EventCardWidget({this.index});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Center(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 0.008*_height,
                        ),
                        Container(
                              height: 0.13392857*_height,
                              width: 0.83*_width,
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(25) ),
                              color: Colors.white,
                              ),
                              child: Align(
                                    alignment: Alignment.centerRight,
    child: 
        Row(
          children: [
            SizedBox(width: 0.337*_width,),
            Container(
              width: 0.45*_width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(eventCardTest[index].title,style: Theme.of(context).textTheme.subtitle1.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 16))),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(eventCardTest[index].text,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText3Color.withOpacity(1),fontSize: 10))),
                Align(
                alignment: Alignment.centerRight,
                child: Text(eventCardTest[index].date,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText2Color.withOpacity(1),fontSize: 14))),
                ],
              ),
            ),
          ],
        ),
                                  ),
                              ),
                      ],
                    ),
                              Positioned(
                                child: ProfilePhoto(photoUrl:eventCardTest[index].imageURL,sizedRatio: 0.14955357,),
                              ),
                  ],
                ),
              );
  }
}