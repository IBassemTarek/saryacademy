import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  String photoUrl;
  double sizedRatio;
  ProfilePhoto({this.photoUrl,this.sizedRatio});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return  Container(
      width: _height*sizedRatio,
      height: _height*sizedRatio,
      decoration: new BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: Color(0xffBCBCBC),
        ),
        shape: BoxShape.circle,
        color: Colors.black,
        image: new DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(photoUrl)
        ),
    ));
  }
}