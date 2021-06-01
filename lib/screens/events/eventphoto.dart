import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EventPhoto extends StatelessWidget {
  final double sizedRatio;
  final String photourl;
  EventPhoto({this.sizedRatio,this.photourl});
  
  @override
  Widget build(context) {
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
        // color: Colors.black,
    ),
    child:CircleAvatar(
    radius: 18,
    child: CachedNetworkImage(
    placeholder: (context, url) => CircularProgressIndicator(),
    imageUrl: photourl,
    errorWidget: (___, _, __) {
            return  Image.asset(
              'assets/images/No-Image.png',
              height: _height*sizedRatio,
              width: _height*sizedRatio,
              fit: BoxFit.cover);
          },
  ),
),
    );
  }
}