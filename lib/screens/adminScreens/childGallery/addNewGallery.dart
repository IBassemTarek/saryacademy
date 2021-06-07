import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/services/galleryDatabase.dart';
import '../../../models/childUID.dart';
import '../../../shared/adminCustomTextField.dart';
import '../../../shared/titleTextField.dart';
import '../../../const.dart';
import 'addButtom.dart';
import 'galleryItemsList.dart';
// ignore: must_be_immutable
class AddNewGallery extends StatelessWidget {
  String title;
  String imageURLTemp;
  final bool newEvent;
  final String galleryID;
  AddNewGallery({this.galleryID,this.newEvent});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final uid = Provider.of<ChildModel>(context).uid;
    return Container(
      width: 0.90338 * _width,
      padding: EdgeInsets.symmetric(
        horizontal: 0.05555 * _width,
        vertical: 0.020089 * _height,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Container(
            width: 0.492754*_width,
            height: _height * 0.043,
            child: TitleTextField(
              lableText: "Title",
              onClick: (value) {
                title = value;
              },
            ),
          ),
          SizedBox(
            height: _height * 0.01,
          ),
          ListView.separated(
                        physics: NeverScrollableScrollPhysics(),  
                        shrinkWrap:true,
                        itemBuilder: (context,i) {
                        return AddedImageURLCard(imageURL: Provider.of<GalleryItemsList>(context).imageURL[i],); 
                        }, 
                        itemCount: Provider.of<GalleryItemsList>(context).imageURL.length, 
                        separatorBuilder: (BuildContext context, int index) {
                          return  SizedBox(
                                            height: _height * 0.01,
                                       );
                          },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(
            height: _height*0.05,
            width: _width*0.5869565,
            child: AdminTextField(
              maxLines: 1,
              lableText: "Image URL",
              onClick: (value) {
                print(value);
                imageURLTemp = value;
              },
            ),),
             InkWell(
               onTap: (){
                Provider.of<GalleryItemsList>(context,listen: false).addImage(imageURLTemp: imageURLTemp);  
               },
               child: Icon(Icons.add_circle_outline,color:kText2Color.withOpacity(1),size: 0.028*_height,)),
            ],
          ),
          SizedBox(
            height: _height * 0.01,
          ),
          AddBotton( 
                  text: newEvent?"add":"update",
                  onTap: () {
                    if(newEvent)
                    {
                    if ( title != null &&  Provider.of<GalleryItemsList>(context,listen: false).imageURL!=[]) 
                        GalleryDataBaseServices(uid: uid)
                            .addNewGalleryData( 
                              eventName: title,
                              imagesURL: Provider.of<GalleryItemsList>(context,listen: false).imageURL,
                            );
                        else 
                        {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("enter you Info again"),
                                   ));
                        }
                    }
                    else {
                    if ( title != null && Provider.of<GalleryItemsList>(context,listen: false).imageURL!=[] ) 
                    GalleryDataBaseServices(uid: uid)
                            .updateGalleryData(
                              eventName: title,
                              imagesURL: Provider.of<GalleryItemsList>(context,listen: false).imageURL,
                              id:galleryID,
                              context: context,
                            );
                        else 
                        {
                                print(title);
                                Provider.of<GalleryItemsList>(context,listen: false).imageURL.forEach((element) {
                                  print(element);
                                });
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("enter you Info again"),
                                   ));
                        }
                    }

                  },
                  ),
        ],
      ),
    );
  }
}



// ignore: must_be_immutable
class AddedImageURLCard extends StatelessWidget {
  String imageURL;
  AddedImageURLCard({this.imageURL});
  @override
  Widget build(BuildContext context) {
    
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Consumer<GalleryItemsList>(
      builder: (context,galleryItemsList,child ) {
        return Column(
        children: [
          Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(
                  height: _height*0.05,
                  width: _width*0.5869565,
                  child: AdminTextField(
                    maxLines: 1,
                    lableText: "Image URL",
                    initialData: imageURL,
                    onClick: (value) {
                      imageURL = value;
                    },
                  ),),
                   InkWell(
                     onTap: (){
                       galleryItemsList.removeImage(image: imageURL);
                     },
                     child: Icon(Icons.delete_forever,color:kText2Color.withOpacity(1),size: 0.028*_height,)),
                  ],
                ),
            SizedBox(
              height: _height * 0.01,
            ),
        ],
      ); 
      },
    );
  }
}
