import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_svg/svg.dart';

import '../../const.dart';

class PRCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Stack(
                  children: [
                        Container(
                              height:  0.13392857*_height ,
                              width: 0.90338*_width,
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10) ),
                              color: Colors.white,
                              ),
                              child: Align(
                                    alignment: Alignment.centerRight,
                                      child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                          Locales.currentLocale(context).toString() == "en" ?
                                          LocaleText("Progress",style: 
                                           Theme.of(context).textTheme.headline1.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 30)
                                          ):
                                          LocaleText("Progress",style: 
                                          Theme.of(context).textTheme.subtitle2.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 30)
                                          ),
                                          Row(
                                            children: [
                                          Locales.currentLocale(context).toString() == "en" ?
                                          LocaleText("Report",style:   Theme.of(context).textTheme.headline1.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 30) 
                                          ):
                                          LocaleText("Report",style:
                                          Theme.of(context).textTheme.subtitle2.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 30)
                                          ),
                                          SizedBox(
                                            width: 0.02831*_width,
                                          ),
                                              LocaleText('Enter',style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText1Color.withOpacity(1),fontSize: 18)),
                                              Image.asset('assets/images/home/arrow.png'),
                                            ],
                                          ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 0.04831*_width,
                                          ),
                                      ],
                                    ),
                                  ),

                    ),

                            Positioned(
                                // left: 0.0821256*_width,
                                child: 
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20,right: 20),
                                      child: SvgPicture.asset('assets/images/home/PRicon.svg'),
                                    ),
                              ),
                    
                  ],
               
              );
  }
}