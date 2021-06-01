import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/galleryModel.dart';
import 'package:saryacademy/shared/backArrowBotton.dart';
import 'package:saryacademy/shared/bottombar.dart';
import 'package:saryacademy/shared/loading.dart';

import '../../const.dart';
import 'galleryOnephoto.dart';
import 'galleryTwophotos.dart';
import 'horizonalScroll.dart';

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final _galleries = Provider.of<List<GalleryModel>>(context);
    if (_galleries.isEmpty)
     return Container(
      decoration: BoxDecoration(
         borderRadius: BorderRadius.all(Radius.circular(10) ),
         color: Colors.white,
       ),
       height: 0.13392857*_height,
       width: 0.90338*_width,
      child: Loading(),
      );
    else
    return Scaffold(
      bottomNavigationBar: BottomBar(widgetName: 'Gallery',),
      backgroundColor: kbackgroundColor.withOpacity(1),
      appBar: AppBar(
        leading: BackArrowBotton(),
        centerTitle: false,
        titleSpacing: 0,
        elevation:0,
        backgroundColor: Colors.transparent,
        title: Text("Gallery",style: Theme.of(context).textTheme.headline1.copyWith( color:kIconColor.withOpacity(1),fontSize: 36)),
      ),

      body:  
          Stack(
            children: [
              ListView.separated(
                shrinkWrap:true,
                itemCount: _galleries.length,
                separatorBuilder: (context,i)=>  SizedBox(height:0.0279*_height,),
                itemBuilder:  (context,i) {
                  if(_galleries[i].imagesURL.length==1)
                  {
                    return GalleryOnePhoto(eventTitle: _galleries[i].eventName,imageURL: _galleries[i].imagesURL[0],);
                  }
                  else if (_galleries[i].imagesURL.length==2)
                  {
                      return GalleryTwoPhotos (eventName: _galleries[i].eventName,imagesURL: _galleries[i].imagesURL,);
                  }
                  else {
                      return HorizonalScroll(width: _width, eventName: _galleries[i].eventName, height: _height, imagesURL: _galleries[i].imagesURL);
                  }
                }
              
        

      ),
            ],
          ),
    );
  }
}