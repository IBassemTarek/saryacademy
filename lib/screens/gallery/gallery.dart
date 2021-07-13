import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';


import '../../../models/galleryModel.dart';
import '../../../models/isEmpty.dart';
import '../../../services/galleryDatabase.dart';
import '../../../shared/backArrowBotton.dart';
import '../../../shared/bottombar.dart';
import '../../../shared/loading.dart';
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
    return FutureBuilder( 
      future: GalleryDataBaseServices().checkIfEmpty(context: context),
      builder: (_,__) => Scaffold(
        bottomNavigationBar: BottomBar(widgetName: 'Gallery',),
        backgroundColor: kbackgroundColor.withOpacity(1),
        appBar: AppBar(
          leading: BackArrowBotton(),
          centerTitle: false,
          titleSpacing: 0,
          elevation:0,
          backgroundColor: Colors.transparent,
          title: LocaleText("Gallery",style: Theme.of(context).textTheme.headline1.copyWith( color:kIconColor.withOpacity(1),fontSize: 36)),
        ),
    
        body:  
            Consumer<IsEmptyModel>(
              
              builder:(_,x,___)=> 
              Builder(
                builder: (context) {
                  if (x.galleryIsEmpty == false && x.galleryIsEmpty!=null)
                  return Stack(
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
                  );
                  else if (x.galleryIsEmpty == true && x.galleryIsEmpty!=null)
                  return Center(
                    child: Container(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10) ),
          color: Colors.white,
          ),
          height: 0.12*_height,
          width: 0.90338*_width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text("No gallery setted yet",style:Theme.of(context).textTheme.headline1.copyWith( color:kbackgroundColor.withOpacity(1),fontSize: 23) ,textAlign: TextAlign.center,)),
          ),
     ));

     else 
          return Center(
            child: Container( 
      child: Loading(),
      ),
          );
                }
              ),
            ),
      ),
    );
  }
}