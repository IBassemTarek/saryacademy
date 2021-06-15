import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/eventModel.dart';
import 'package:intl/intl.dart';

import '../../const.dart';
class NextEventCard extends StatelessWidget {
  final int index;
  NextEventCard({this.index});
  String dateConvert(int date) {
    return DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(date));
    // DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(_events[0].datea.millisecondsSinceEpoch));
  }
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final _events = Provider.of<List<EventCard>>(context);
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
                  child: Text(_events[index].title,style: Theme.of(context).textTheme.subtitle1.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 18))),
                Container(
                  height:0.1875*_height,
                  width:0.768116*_width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10) ),
                  ),
                  child:CachedNetworkImage(
                        placeholder: (context, url) => Center(
      child: SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(
        )),
    ),
                    imageUrl: _events[index].imageURL,
                    errorWidget: (___, _, __) {
                return  Container(
                  height:0.1875*_height,
                  width:0.768116*_width,
                        child: Image.asset(
                          'assets/images/No-Image.png',
                          fit: BoxFit.cover),
                );
              },
  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(_events[index].text,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText3Color.withOpacity(1),fontSize: 10))),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(dateConvert(_events[index].date.millisecondsSinceEpoch),style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText2Color.withOpacity(1),fontSize: 14))),
              ],
            ),
          ),
    );
  }
}