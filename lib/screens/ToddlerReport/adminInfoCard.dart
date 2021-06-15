

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/childUID.dart';
import 'package:saryacademy/services/toddlerPRDatabase.dart';
import '../../const.dart';
import 'checkIcon.dart';
class AdminInfoCard extends StatelessWidget {
  final String iconUrl;
  final String title;
  final List<String> description;
  final List<dynamic> done;
  
  AdminInfoCard({this.iconUrl,this.title,this.description,this.done});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final uid = Provider.of<ChildModel>(context).uid;
    return  Container(
      child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               SvgPicture.asset(iconUrl),
                                SizedBox(width: 0.025*_width,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    
                                    Text(title,style: Theme.of(context).textTheme.subtitle1.copyWith( color:kText4Color.withOpacity(1),fontSize: 12)),
                                    SizedBox(height: 0.01*_height,),
                                    Container(
                                      width: 0.22*_width,
                                      child: ListView.separated(
                                        physics: const NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap:true,
                                        itemBuilder: (context,i) {

                                            return InkWell(
                                              onTap: (){
                                                if (done[i])
                                                {
                                                  done[i]=false;
                                                  ToddlerPRDataBaseServices().updateListToggled(
                                                    list: done,
                                                    uid: uid,
                                                    title: title
                                                    );
                                                }
                                                  
                                                else 
                                                {
                                                  done[i]=true;
                                                  ToddlerPRDataBaseServices().updateListToggled(
                                                    list: done,
                                                    uid: uid,
                                                    title: title
                                                    );
                                                }
                                                    
                                              },
                                              child: Row(children: [
                                                  CheckIcon(checked: done[i],),
                                                  SizedBox(width: 10,),
                                                  Text(description[i],style: Theme.of(context).textTheme.bodyText1.copyWith( color:kText4Color.withOpacity(1),fontSize: 12)),
                                              ],),
                                            ); 
                                        }, 
                                        separatorBuilder:  (context,i)=>  SizedBox(height:0.005*_height,), 
                                        itemCount:  description.length),
                                    )
                                  ],
                                )
                            ],),
    );
  }
}