import 'package:flutter/material.dart';

class GalleryOnePhoto extends StatelessWidget {
  final dynamic imageURL;
  final String eventTitle;
  GalleryOnePhoto({this.imageURL,this.eventTitle});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left:0.084541*_width ),
          alignment: Alignment.centerLeft,
          child: Text( eventTitle,style: Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.white,fontSize: 24),textAlign: TextAlign.left,)),
        SizedBox(
          height:0.01674*_height
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset("assets/images/gallery/dec1.png")),
          Container(
            height: 0.252232*_height,
            width: 0.816425*_width,
                decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(15) ),),
          child:Image.network(imageURL),
          ),
          ],
          
        )
      ],
    );
  }
}