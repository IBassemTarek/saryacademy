import 'package:flutter/material.dart';
import '../../const.dart';
class CheckIcon extends StatelessWidget {
  final bool checked;
  CheckIcon({this.checked});
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Container(
      width: 0.03*_width,
      alignment: Alignment.topCenter,
      decoration: new BoxDecoration(  shape: BoxShape.circle,color: kGreyColor.withOpacity(1),),
      child: Center(child: Icon(Icons.check,size:  0.04*_width,color: checked?Colors.black:Colors.transparent)));
  }
}