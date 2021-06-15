import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HorizonalScroll extends StatelessWidget {
  const HorizonalScroll({
    Key key,
    @required double width,
    @required this.eventName,
    @required double height,
    @required this.imagesURL,
  }) : _width = width, _height = height, super(key: key);

  final double _width;
  final String eventName;
  final double _height;
  final List imagesURL;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left:0.084541*_width ),
          alignment: Alignment.centerLeft,
          child: Text( eventName,style: Theme.of(context).textTheme.bodyText1.copyWith( color:Colors.white,fontSize: 24),textAlign: TextAlign.left,)),
        SizedBox(
          height:0.01674*_height
        ),
        Container(
          height: 0.15625*_height,
                  child: ListView.separated(
                    padding: EdgeInsets.only(left:0.084541*_width ),
              scrollDirection: Axis.horizontal,
              shrinkWrap:true,
              itemCount: imagesURL.length,
              separatorBuilder: (context,i)=>  SizedBox(width:0.036232*_width,),
              itemBuilder:  (context,i) {
                return Container(
                  
              height: 0.1484375*_height,
                  decoration: BoxDecoration(
                   borderRadius: BorderRadius.all(Radius.circular(10) ),),
            child:
CachedNetworkImage(
    placeholder: (context, url) => Center(
      child: SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(
        )),
    ),
    imageUrl: imagesURL[i] ,
    
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
                );
              }
          ),
        )
      ],
    );
  }
}