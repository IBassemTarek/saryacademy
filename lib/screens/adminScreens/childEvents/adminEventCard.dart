import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../../models/childUID.dart';
import '../../../models/eventModel.dart';
import '../../../screens/events/eventphoto.dart';
import '../../../services/eventsDatabase.dart';
import '../../../const.dart';
import 'addNewEvent.dart';

class AdminEventCardWidget extends StatefulWidget {
  final int index;
  AdminEventCardWidget({this.index});

  @override
  State<AdminEventCardWidget> createState() => _AdminEventCardWidgetState();
}

class _AdminEventCardWidgetState extends State<AdminEventCardWidget> {
  String dateConvert(int date) {
    return DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(date));
  }
    bool edit= false;
  @override
  Widget build(BuildContext context) {
    final uid = Provider.of<ChildModel>(context).uid;
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final _events = Provider.of<List<EventCard>>(context);
    return Center(
                child: AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  child: 
                  (() {
                  if (! edit)
                  return Stack(
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
                    child: Text(_events[widget.index].title,style: Theme.of(context).textTheme.subtitle1.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 16))),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(_events[widget.index].text,style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText3Color.withOpacity(1),fontSize: 10))),
                  
                  Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                                print('ded');                              
                              setState(() {
                               edit = true; 
                              });
                            },
                            child: Icon(Icons.edit,color:kText2Color.withOpacity(1),size: 16,)),
                          SizedBox(
                            width: _width*0.02,
                          ),
                          InkWell(
                            onTap: (){
                               EventDataBaseServices(uid: uid)
                              .deleteEvent(_events[widget.index].id);
                            },
                            child: Icon(Icons.delete_forever,color:kText2Color.withOpacity(1),size: 16,)),
                        ],
                      ),
                      Text(dateConvert(_events[widget.index].date.millisecondsSinceEpoch),style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText2Color.withOpacity(1),fontSize: 14)),
                    ],
                  )),
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
                                  top: 0.00993*_height,
                                  left: Locales.currentLocale(context).toString() == "ar" ? 0.484155*_width:0.024155*_width,
                                  child: EventPhoto(photourl:_events[widget.index].imageURL,sizedRatio: 0.12955357,),
                                ),
                    ],
                  );
                  else 
                  return AddNewEvent(newEvent: false,eventID: _events[widget.index].id,);
                   }())
                ),
              );
  }
}