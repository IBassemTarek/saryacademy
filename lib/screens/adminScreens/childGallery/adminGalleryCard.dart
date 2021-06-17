import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';


import '../../../services/galleryDatabase.dart';
import '../../../models/childUID.dart';
import '../../../const.dart';
import '../../../models/galleryModel.dart';
import 'addNewGallery.dart';
import '../../../models/galleryItemsList.dart';
// import 'addNewEvent.dart';

class AdminGalleryCard extends StatefulWidget {
  final int index;
  AdminGalleryCard({this.index});

  @override
  State<AdminGalleryCard> createState() => _AdminGalleryCardState();
}

class _AdminGalleryCardState extends State<AdminGalleryCard> {
  String dateConvert(int date) {
    return DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(date));
  }
    bool edit= false;
  @override
  Widget build(BuildContext context) {
    final uid = Provider.of<ChildModel>(context).uid;
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final _gallery = Provider.of<List<GalleryModel>>(context);
    return Center(
                child: AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  child: 
                  (() {
                  if (! edit)
                  return Container(
                            height: 0.13392857*_height,
                            width: 0.83*_width,
                            padding: EdgeInsets.symmetric(horizontal: 0.043478*_width, vertical: 0.00892857*_height),
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25) ),
                            color: Colors.white,
                            ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_gallery[widget.index].eventName,style: Theme.of(context).textTheme.subtitle1.copyWith( color:kText2Color.withOpacity(1),fontSize: 18)),
                            Row(
                              children: [
                                InkWell(
                                  onTap: (){                             
                                    setState(() {
                                     edit = true; 
                                    });
                                  },
                                  child: Icon(Icons.edit,color:kText2Color.withOpacity(1),size: 16,)),
                                SizedBox(
                                  width: _width*0.02,
                                ),
                                InkWell(
                                  onTap: (){
                              GalleryDataBaseServices(uid: uid)
                              .deleteGallery(_gallery[widget.index].id);
                                  },
                                  child: Icon(Icons.delete_forever,color:kText2Color.withOpacity(1),size: 16,)),
                              ],
                            ),
                          ],
                        ),

          Container(
          height: 0.0856875*_height,
                  child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap:true,
              itemCount: _gallery[widget.index].imagesURL.length,
              separatorBuilder: (context,i)=>  SizedBox(width:0.01*_width,),
              itemBuilder:  (context,i) {
                return Container(
              height:0.0546875*_height,
              width: 0.212*_width,
                  decoration: BoxDecoration(
                   borderRadius: BorderRadius.all(Radius.circular(10) ),),
            child:
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  child:   CachedNetworkImage(
  
      placeholder: (context, url) => Center(
  
        child: SizedBox(
  
          width: 25,
  
          height: 25,
  
          child: CircularProgressIndicator(
  
          )),
  
      ),
  
      imageUrl: _gallery[widget.index].imagesURL[i],
  
      
  
      errorWidget: (___, _, __) {
  
                  return  Container(
                      decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
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
            
            // Image.network(_gallery[widget.index].imagesURL[i]),
                );
              }
          ),
        )

                      ],
                    ),
                  );
                  else 
                  return 
ChangeNotifierProvider(
  create: (context) => GalleryItemsList(),
  child: AddNewGallery(newEvent: false,galleryID: _gallery[widget.index].id,));
                   }())
                ),
              );
  }
}