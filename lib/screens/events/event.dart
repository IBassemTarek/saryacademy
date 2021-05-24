import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/eventModel.dart';
import 'package:saryacademy/shared/backArrowBotton.dart';
import 'package:saryacademy/shared/loading.dart';
import '../../const.dart';
import 'EventCard.dart';
import 'nextEventCard.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kbackgroundColor.withOpacity(1),
      appBar: AppBar(
        leading: BackArrowBotton(),
        centerTitle: false,
        titleSpacing: 0,
        elevation:0,
        backgroundColor: Colors.transparent,
        title: Text("Upcoming events",style: Theme.of(context).textTheme.headline1.copyWith( color:kIconColor.withOpacity(1),fontSize: 30)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0483092*_width , vertical:0.03*_width ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 0.0483092*_width ,vertical: 0.02*_height),
          height:0.78125*_height,
          width: 0.90334*_width,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40) ),
          color:kbackgroundColor2.withOpacity(1),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 0.018*_height),
            child: 
                Container(
                  width: 0.83575*_width,
                  child:ListOfEvents()
                ),
          ),),),
    );
  }
}

class ListOfEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _events = Provider.of<List<EventCard>>(context);
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width; 
    if (_events.isEmpty)
     return Container(
      decoration: BoxDecoration(
         borderRadius: BorderRadius.all(Radius.circular(10) ),
         color: Colors.white,
       ),
       height: 0.13392857*_height,
       width: 0.90338*_width,
      child: Loading(),
      );
    else
    _events.sort((a, b) => a.order.compareTo(b.order));
    return ListView.separated(
                        shrinkWrap:true,
                        itemBuilder: (context,i) {
                        if (_events[i].nextEvent)
                        return NextEventCard(index: i,);
                        else
                        return EventCardWidget(index: i,); 
                        }, 
                        itemCount: _events.length, 
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height:0.03*_height);
                          },
                        );
  }
}
