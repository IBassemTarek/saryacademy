import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/alertModel.dart';
import 'package:saryacademy/shared/backArrowBotton.dart';
import '../../../shared/alertchecker.dart'; 

import '../../../const.dart';

class AlertAdmin extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final alerts = Provider.of<List<AlertModel>>(context); 
    if (alerts.isEmpty)
    return Container();
    else
    {
    alerts.sort((a,b)=>a.dateTime.compareTo(b.dateTime));
    alertcheck(context:context);
    return Scaffold(
      appBar: AppBar(
        leading: BackArrowBotton(),
        centerTitle: true,
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Alerts",
            style: Theme.of(context).textTheme.headline1.copyWith(
                color: kbackgroundColor.withOpacity(1), fontSize: 36)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: 0.068 * _width, vertical: 0.0223 * _height),
        child:   ListView.separated(
          itemCount: alerts.length,
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: 0.03857 * _height),
          itemBuilder: (context, i) { 
            return SingleAlertWidget(
              name: alerts[i].name,
              date: alerts[i].day.toString()+"-"+alerts[i].month.toString()+"-"+alerts[i].year.toString(),

              status: alerts[i].showed,
            );
            
            }                
          ),
          
      )
    );
    }

  }
}


class SingleAlertWidget extends StatelessWidget {
  final String name;
  final String date;
  final bool status; 
  final DateTime dateTime;
SingleAlertWidget({this.date,this.name,this.status,this.dateTime});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width; 
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 0.7198 * _width,
            height: 0.029 * _height,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 0.038 * _width),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: kText1Color.withOpacity(1),
            ),
            child: Text(
              date,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
        SizedBox(height: 0.01657 * _height),
        Row(
                children: [
                  Container(
                    width: 0.7898 * _width,
                    height: 0.029 * _height,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 0.038 * _width),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border:
                            Border.all(color: kGreyColor.withOpacity(1))),
                    child: Row(
                      children: [
                        Text(
                          name,
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: kGradColor2.withOpacity(1), fontSize: 12),
                        ),
                        Text(
                          "'s parents want to talking for you.",
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: kText1Color.withOpacity(1), fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),  
                  InkWell(
                    child: Icon(Icons.done_all,
                        size: 0.0486 * _width,
                        color: status?kbackgroundColor2.withOpacity(1):kGreyColor.withOpacity(1)),
                  )
                ]
              )
           
       
      ],);
  }
}

