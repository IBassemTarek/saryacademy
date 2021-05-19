import 'package:flutter/material.dart';
import 'package:saryacademy/models/galleryModel.dart';
import 'package:saryacademy/shared/backArrowBotton.dart';

import '../../const.dart';
import 'galleryOnephoto.dart';
import 'galleryTwophotos.dart';
import 'horizonalScroll.dart';

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kbackgroundColor.withOpacity(1),
      appBar: AppBar(
        leading: BackArrowBotton(),
        centerTitle: false,
        titleSpacing: 0,
        elevation:0,
        backgroundColor: Colors.transparent,
        title: Text("Gallery",style: Theme.of(context).textTheme.headline1.copyWith( color:kIconColor.withOpacity(1),fontSize: 36)),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox( height: 0.0078*_height ),
          ListView.separated(
            shrinkWrap:true,
            itemCount: galleryCardTest.length,
            separatorBuilder: (context,i)=>  SizedBox(height:0.0279*_height,),
            itemBuilder:  (context,i) {
              if(galleryCardTest[i].imagesURL.length==1)
              {
                return GalleryOnePhoto(eventTitle: galleryCardTest[i].eventName,imageURL: galleryCardTest[i].imagesURL[0],);
              }
              else if (galleryCardTest[i].imagesURL.length==2)
              {
                  return GalleryTwoPhotos (eventName: galleryCardTest[i].eventName,imagesURL: galleryCardTest[i].imagesURL,);
              }
              else {
                  return HorizonalScroll(width: _width, eventName: galleryCardTest[i].eventName, height: _height, imagesURL: galleryCardTest[i].imagesURL);
              }
            }
          )
          ],
        ),

      ),
    );
  }
}