import 'package:flutter/material.dart';
import '../const.dart';

class CardOfInfo extends StatelessWidget {
  final String title;
  final String subtitle;
  CardOfInfo({this.title,this.subtitle}):assert(title!=null);
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return   Container(
                      alignment: Alignment.centerLeft,
                    height: 0.0747767857*_height,
                    width: 0.90338*_width,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10) ),
                    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
                    ),
                    child: Row(
                      children: [
                          SizedBox(
                            width: 0.099*_width,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                                Text(title,style:Theme.of(context).textTheme.subtitle1.copyWith( color:kText2Color.withOpacity(1),fontSize: 18) ,),
                                 Text(subtitle,style:Theme.of(context).textTheme.bodyText1.copyWith( color:kText3Color.withOpacity(1),fontSize: 14) ,),
                              
                            ],
                          )
                      ],
                    ),
                    );

  }
}