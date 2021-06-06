import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/childUID.dart';
import 'package:saryacademy/services/eventsDatabase.dart';
import 'package:saryacademy/shared/adminCustomTextField.dart';
import 'package:saryacademy/shared/titleTextField.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import '../../../const.dart';
import 'addButtom.dart';
// ignore: must_be_immutable
class AddNewEvent extends StatelessWidget {
  String title;
  String descreption;
  String imageURL;
  var date;
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final uid = Provider.of<ChildModel>(context).uid;
    final format = DateFormat("yyyy-MM-dd HH:mm");
    print(date);
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
                    title = value;
                  },
                ),
              ),
      // Container(
      //   height: 0.043*_height,
      //   width: 0.37*_width,
TextButton(
    onPressed: () {
        DatePicker.showDatePicker(context,
                              showTitleActions: true,
                          //     onChanged: (date) {
                          //   print('change $date');
                          // }, 
                          onConfirm: (value) {
                            print(value.runtimeType);
                            print('confirm $value');
                          }, currentTime: DateTime.now(), locale: LocaleType.en);
    },
    child: Text(
        'Select Date',
        style: TextStyle(color: Colors.blue),
    )
        // child: DateTimeField(
        //   textAlign: TextAlign.end, 
        //   style:Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.grey, fontSize: 11),
        //   initialValue: DateTime.now(),
        //   format: format,
        //   decoration: InputDecoration(labelText: 'Select Date', enabledBorder: OutlineInputBorder(
        //               gapPadding: 0,
        //               borderSide: BorderSide(
        //                 color: kGreyColor.withOpacity(1),
        //               ),
        //               borderRadius: BorderRadius.circular(10.0),
        //             ),),
        //     onChanged: (value) {
        //       if (value!= null)
        //       {
        //       print(value.runtimeType);
        //       date = Timestamp.fromDate(value);
        //       print(date);
        //       }

        //     },
        // onShowPicker: (context, currentValue) async {
        //   final date = await showDatePicker(
        //       context: context,
        //       firstDate: DateTime(1900),
        //       initialDate: currentValue ?? DateTime.now(),
        //       lastDate: DateTime(2100));
        //   if (date != null) {
        //     final time = await showTimePicker(
        //       context: context,
        //       initialTime:
        //           TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
        //     );
        //     return DateTimeField.combine(date, time);
        //   } else {
        //     return currentValue;
        //   }
        // }, 
        // ),
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
                descreption = value;
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
                imageURL = value;
              },
            ),),
              AddBotton( 
                  text: "add",

                  onTap: () {
                    if (descreption != null && title != null && imageURL!= null && date!=null) 
                    // print(date);
                        EventDataBaseServices(uid: uid)
                            .addNewEventrData(
                              date: date, 
                              imageURL: imageURL,
                              text: descreption,
                              title: title,
                            );
                        else 
                        print('dw');
                        print(descreption);
                        print(title);
                        print(imageURL);
                        print(date);
                  }),
            ],
          )
        ],
      ),
    );
  }
}
