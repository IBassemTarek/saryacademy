import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import '../../../models/eventModel.dart';
import '../../../models/modalprogrsshub.dart';
import '../../../shared/alertchecker.dart';
import '../../../shared/backArrowBotton.dart';
import '../../../shared/loading.dart';
import '../../../const.dart';
import 'addNewEvent.dart';
import 'adminEventCard.dart';

class ChildEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    alertcheck(context: context);
    return Scaffold(
      // bottomNavigationBar: BottomBar(widgetName: "EventsPage",),
      backgroundColor: kbackgroundColor.withOpacity(1),
      appBar: AppBar(
        leading: BackArrowBotton(),
        centerTitle: true,
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: LocaleText("Events",
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(color: kIconColor.withOpacity(1), fontSize: 30)),
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHub>(context).isLoading,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 0.0483092 * _width, vertical: 0.03 * _width),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: 0.0483092 * _width, vertical: 0.02 * _height),
            width: 0.90334 * _width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: kbackgroundColor2.withOpacity(1),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 0.018 * _height),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AddNewEvent(
                      newEvent: true,
                    ),
                    SizedBox(height: 0.03 * _height),
                    Container(width: 0.83575 * _width, child: ListOfEvents()),
                  ],
                ),
              ),
            ),
          ),
        ),
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
    if (_events.isEmpty)
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        height: 0.13392857 * _height,
        width: 0.90338 * _width,
        child: Loading(),
      );
    else
      _events.sort((a, b) => b.date.compareTo(a.date));
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return AdminEventCardWidget(
          index: i,
        );
      },
      itemCount: _events.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 0.03 * _height);
      },
    );
  }
}
