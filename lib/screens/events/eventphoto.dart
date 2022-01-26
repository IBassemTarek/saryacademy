
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EventPhoto extends StatelessWidget {
  final double sizedRatio;
  final String photourl;
  EventPhoto({this.sizedRatio, this.photourl});

  @override
  Widget build(context) {
    final _height = MediaQuery.of(context).size.height;

    return Container(
        width: _height * sizedRatio,
        height: _height * sizedRatio,
        decoration: BoxDecoration(
            border: Border.all(
              width: 1.5,
              color: Color(0xffBCBCBC),
            ),
            shape: BoxShape.circle, 
                
                ),
                child: CircleAvatar(
      backgroundColor: Color(0xffEEEEEE),
    radius: 18,
    child: ClipOval(
        child: CachedNetworkImage(
          fit: BoxFit.fill,
                        placeholder: (context, url) => Center(
      child: SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(
        )),
    ),
        width: _height * sizedRatio,
        height: _height * sizedRatio,
    imageUrl:  photourl,
    errorWidget: (___, _, __) {
                return  Container(
                        width: _height*sizedRatio,
                        height: _height*sizedRatio,
                        child: Image.asset(
                          'assets/images/No-Image.png',
                          fit: BoxFit.cover),
                );
              },
   
)
    ),
)
                ,);
  }
}
 
