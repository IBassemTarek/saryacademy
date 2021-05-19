import 'package:flutter/material.dart';

import 'horizonalScroll.dart';


class GalleryTwoPhotos extends StatelessWidget {
  final List<String> imagesURL;
  final String eventName;
  GalleryTwoPhotos({this.imagesURL,this.eventName});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Image.asset('assets/images/gallery/dec2.png',height: 0.2622*_height,)),
        HorizonalScroll(width: _width, eventName: eventName, height: _height, imagesURL: imagesURL),
      ],
    );
  }
}