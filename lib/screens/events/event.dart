import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../../models/eventModel.dart';
import '../../../models/isEmpty.dart';
import '../../../services/eventsDatabase.dart';
import '../../../shared/backArrowBotton.dart';
import '../../../shared/bottombar.dart';
import '../../../shared/loading.dart';
import '../../const.dart';
import 'EventCard.dart';
import 'nextEventCard.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomBar(widgetName: "EventsPage",),
      backgroundColor: kbackgroundColor.withOpacity(1),
      appBar: AppBar(
        leading: BackArrowBotton(),
        centerTitle: false,
        titleSpacing: 0,
        elevation:0,
        backgroundColor: Colors.transparent,
        title: Text("Upcoming events",style: Theme.of(context).textTheme.headline1.copyWith( color:kIconColor.withOpacity(1),fontSize: 30)),
      ),
      body: FutureBuilder(
        future: EventDataBaseServices().checkIfEmpty(),
        builder:(_,__)=> Padding(
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
      ),
    );
  }
}

class ListOfEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _events = Provider.of<List<EventCard>>(context);
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width; 
 
    _events.sort((a, b) => b.date.compareTo(a.date));    
    return Consumer<IsEmptyModel>(
      
      builder:(_,x,___)=>   
      
              FutureBuilder(
        future: EventDataBaseServices().checkIfEmpty(context: context),
        builder:(_,__) {
                  print(x.eventIsEmpty);
                  if (x.eventIsEmpty == false && x.eventIsEmpty!=null)
                        return ListView.separated(
                            shrinkWrap:true,
                            itemBuilder: (context,i) {
                            if (i==0)
                            return NextEventCard(index: i,);
                            else
                            return EventCardWidget(index: i,); 
                            }, 
                            itemCount: _events.length, 
                            separatorBuilder: (BuildContext context, int index) => SizedBox(height:0.03*_height) 
                            );
                            else if (x.eventIsEmpty == true && x.eventIsEmpty!=null)
                  return Center(
                    child: Container(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10) ),
          color: Colors.white,
          ),
          height: 0.12*_height,
          width: 0.90338*_width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text("No events setted yet",style:Theme.of(context).textTheme.headline1.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 23) ,textAlign: TextAlign.center,)),
          ),
     ));
     else 
               return Center(
            child: Container( 
      child: Loading(),
      ),
          );
                }
      ),
    );
    

  }
}
