import 'package:flutter/material.dart';

import '../../../const.dart';

class AddBotton extends StatelessWidget {
  final String text;
  final Function onTap;

  AddBotton({ @required this.text,this.onTap});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap:onTap,
      child: Container(
          height:_height * 0.05,
          width: _width * 0.2,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(10)),
            color: kText1Color.withOpacity(1),
          ),
          child: Center(
            child: Text(text,
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(
                        color: Colors.white,
                        fontSize:  16)),//16
          )),
    );
  }
}