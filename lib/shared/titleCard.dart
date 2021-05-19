import 'package:flutter/material.dart';
import '../const.dart';

class TitleCard extends StatelessWidget {
  final String title;
  TitleCard({this.title}):assert(title!=null);
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return   Container(
                      alignment: Alignment.centerLeft,
                    height: 0.04799*_height,
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
                          Text(title,style:Theme.of(context).textTheme.subtitle1.copyWith( color:kText2Color.withOpacity(1),fontSize: 18) ,),
                      ],
                    ),
                    );
  }
}