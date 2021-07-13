import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import '../const.dart';

class InfoTable extends StatelessWidget {
//catergories
 final String x1y1;
 final String x2y1;
 final String x3y1;
 final String x4y1;

//values
 final String x1y2;
 final String x2y2;
 final String x3y2;
 final String x4y2;
InfoTable({this.x1y1,this.x1y2,this.x2y1,this.x2y2,this.x3y1,this.x3y2,this.x4y1,this.x4y2});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return  Row(
                  children: [
                            SizedBox(
                              width:0.07*_width,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LocaleText(x1y1,style: Theme.of(context).textTheme.subtitle1.copyWith( color:kText1Color.withOpacity(1),fontSize: 17)),
                                SizedBox(
                                  height: 0.01897*_height,
                                ),
                                LocaleText(x2y1,style: Theme.of(context).textTheme.subtitle1.copyWith( color:kText1Color.withOpacity(1),fontSize: 17)),
                                SizedBox(
                                  height: 0.01897*_height,
                                ),
                                LocaleText(x3y1,style: Theme.of(context).textTheme.subtitle1.copyWith( color:kText1Color.withOpacity(1),fontSize: 17)),
                                SizedBox(
                                  height: 0.01897*_height,
                                ),
                                LocaleText(x4y1,style: Theme.of(context).textTheme.subtitle1.copyWith( color:kText1Color.withOpacity(1),fontSize: 17)),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(x1y2,style: Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.white,fontSize: 16)),
                                SizedBox(
                                  height: 0.01897*_height,
                                ),
                                Text(x2y2,style: Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.white,fontSize: 16)),
                                SizedBox(
                                  height: 0.01897*_height,
                                ),
                                Text(x3y2,style: Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.white,fontSize: 16)),
                                SizedBox(
                                  height: 0.01897*_height,
                                ),
                                Text(x4y2,style: Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.white,fontSize: 16)),
                              ],
                            ),
                            SizedBox(
                              width: 0.099*_width,
                            ),
                           
                  ],
                );
  }
}