import 'package:flutter/material.dart';

import '../../../const.dart';

class SaveBotton extends StatelessWidget {
  final bool smallBotton;
  final String text;
  final Function onTap;

  SaveBotton({this.smallBotton, @required this.text,this.onTap});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap:onTap,
      child: Container(
          height: smallBotton?_height * 0.03:_height * 0.04,
          width: smallBotton?_width * 0.2: _width * 0.3,
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
                        fontSize: smallBotton?16:21)),//16
          )),
    );
  }
}