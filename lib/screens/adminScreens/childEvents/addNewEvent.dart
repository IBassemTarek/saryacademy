import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:saryacademy/shared/driveURLTransfer.dart';

import '../../../models/EditEvent.dart'; 
import '../../../models/childUID.dart';
import '../../../models/dateProvider.dart';
import '../../../services/eventsDatabase.dart';
import '../../../shared/adminCustomTextField.dart';
import '../../../shared/titleTextField.dart';
import '../../../const.dart';
import 'addButtom.dart';
// ignore: must_be_immutable
class AddNewEvent extends StatelessWidget {
  final bool newEvent;
  final String eventID;
  AddNewEvent({this.eventID,this.newEvent});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final uid = Provider.of<ChildModel>(context).uid;
    final format = DateFormat("yyyy-MM-dd HH:mm");
    final editEvent = Provider.of<EditEvent>(context);
    return Container(
      width: 0.90338 * _width,
      height: 0.25 * _height,
      padding: EdgeInsets.symmetric(
        horizontal: 0.05555 * _width,
        vertical: 0.020089 * _height,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      child: Column(

        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [


              Container(
                width: 0.31*_width,
                height: _height * 0.043,
                child: TitleTextField(
                  lableText: "Title",
                  onClick: (value) {
                    editEvent.changeTitle(value); 
                  },
                ),
              ),
      Container(
        height: 0.043*_height,
        width: 0.37*_width,
              child: DateTimeField(
          textAlign: TextAlign.end, 
          style:Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.grey, fontSize: 7.3),
          initialValue: DateTime.now(),
          format: format,
          decoration: InputDecoration(labelText: 'Select Date', enabledBorder: OutlineInputBorder(
                      gapPadding: 0,
                      borderSide: BorderSide(
                        color: kGreyColor.withOpacity(1),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),),
            onChanged: (value) {
              if (value!= null)
              {
              print(value.runtimeType);
              Provider.of<DateProvider>(context,listen: false).changeDate(Timestamp.fromDate(value));
              }

            },
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime:
                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            return DateTimeField.combine(date, time);
          } else {
            return currentValue;
          }
        }, 
        ), 

      ),
            ],
          ),
          SizedBox(
            height: _height * 0.01,
          ),
          Container(
            child: AdminTextField(
              maxLines: 2,
              lableText: "Description",
              onClick: (value) {
                editEvent.changeText(value);
              },
            ),
          ),
          SizedBox(
            height: 0.011162 * _height,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(
            height: _height*0.05,
            width: _width*0.47,
            child: AdminTextField(
              maxLines: 1,
              lableText: "Image URL",
              onClick: (value) {
                editEvent.changeImageURL(driveURLTransfer(value));
              },
            ),),
              AddBotton( 
                  text: newEvent?"add":"update",

                  onTap: () {
                    if(newEvent)
                    {
                    if (editEvent.text != null && editEvent.title != null && editEvent.imageURL!= null && Provider.of<DateProvider>(context,listen: false).date!=null) 
                    // print("done");
                        EventDataBaseServices(uid: uid)
                            .addNewEventrData(
                              date: Provider.of<DateProvider>(context,listen: false).date, 
                              imageURL: editEvent.imageURL,
                              text: editEvent.text,
                              title: editEvent.title,
                            );
                        else 
                        {
                        print('dw');
                        print(editEvent.text);
                        print(editEvent.title);
                        print(editEvent.imageURL);
                        print(Provider.of<DateProvider>(context,listen: false).date);
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("enter you Info again"),
                                   ));
                        }
                    }
                    else {
                      print ("dd");
                    if (editEvent.text != null && editEvent.title != null && editEvent.imageURL!= null && Provider.of<DateProvider>(context,listen: false).date!=null) 
                    {
                    EventDataBaseServices(uid: uid)
                            .updateEventData(
                              date: Provider.of<DateProvider>(context,listen: false).date, 
                              imageURL: editEvent.imageURL,
                              text: editEvent.text,
                              title: editEvent.title,
                              id:eventID,
                              context: context,
                            );
                            
                    }
                    

                        else 
                        {
                        print('dw');
                        print(editEvent.text);
                        print(editEvent.title);
                        print(editEvent.imageURL);
                        print(Provider.of<DateProvider>(context,listen: false).date);
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("enter you Info again"),
                                   ));
                        }
                    }

                  },
                ),
            ],
          )
        ],
      ),
    );
  }
}
