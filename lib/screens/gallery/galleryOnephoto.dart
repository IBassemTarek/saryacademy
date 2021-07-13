import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

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
          padding: Locales.currentLocale(context).toString() == "ar"?EdgeInsets.only(right:0.084541*_width ): EdgeInsets.only(left:0.084541*_width ),
          alignment: Locales.currentLocale(context).toString() == "ar"?Alignment.centerRight:Alignment.centerLeft,
          child: Text( 
            eventTitle,
          textAlign: Locales.currentLocale(context).toString() == "ar"?TextAlign.right:TextAlign.left,
          style: Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.white,fontSize: 24),)),
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
          child:
CachedNetworkImage(
        placeholder: (context, url) => Center(
      child: SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(
        )),
    ),
    imageUrl:  imageURL ,
    
    errorWidget: (___, _, __) {
                return  Container(
                        width:  0.252232*_height,
                        height: 0.816425*_width,
                        child: Image.asset(
                          'assets/images/No-Image.png',
                          // fit: BoxFit.cover
                          ),
                );
              },
  ), 
          ),
          ],
          
        )
      ],
    );
  }
}