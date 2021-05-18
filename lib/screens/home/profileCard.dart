import 'package:flutter/material.dart';
import 'package:saryacademy/shared/profilePhoto.dart';

import '../../const.dart';

class ProfileCard extends StatelessWidget {
  String studentName;
  String profileImageURL;
  ProfileCard({this.profileImageURL,this.studentName});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return  Center(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 0.008*_height,
                        ),
                        Container(
                              height: 0.13392857*_height,
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
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                          Text(studentName,style: Theme.of(context).textTheme.headline1.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 34)),
                                          Row(
                                            children: [
                                              Text('Profile',style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText1Color.withOpacity(1),fontSize: 18)),
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
                      ],
                    ),
                              Positioned(
                                child: ProfilePhoto(photoUrl:profileImageURL,sizedRatio: 0.14955357,),
                              ),
                  ],
                ),
              );
  }
}