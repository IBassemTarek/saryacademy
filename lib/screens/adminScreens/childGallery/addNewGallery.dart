import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../services/galleryDatabase.dart';
import '../../../models/childUID.dart';
import '../../../shared/titleTextField.dart';
import '../../../const.dart';
import 'addButtom.dart';
import '../../../models/galleryItemsList.dart';
import 'uploadGalleryImage.dart';

// ignore: must_be_immutable
class AddNewGallery extends StatelessWidget {
  final bool newEvent;
  final String galleryID;
  AddNewGallery({this.galleryID, this.newEvent});
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
            width: 0.492754 * _width,
            height: _height * 0.043,
            child: TitleTextField(
              lableText: Locales.currentLocale(context).toString() == "ar"
                  ? "العنوان"
                  : "Title",
              onClick: (value) {
                Provider.of<GalleryItemsList>(context, listen: false)
                    .changeTitle(title: value);
              },
            ),
          ),
          SizedBox(
            height: _height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: _width * 0.67,
                child: PhotoGalleryGetLocal(),
              ),
              // Container(
              // height: _height*0.05,
              // width: _width*0.5869565,
              // child: AdminTextField(
              //   maxLines: 1,
              //   lableText: Locales.currentLocale(context).toString() == "ar" ?"رابط الصورة":"Image URL",
              //   onClick: (value) {
              //     print(value);
              //     imageURLTemp = driveURLTransfer(value);
              //   },
              // ),),

              InkWell(
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    String galleryImages = prefs.getString("GalleryImage");
                    Provider.of<GalleryItemsList>(context, listen: false)
                        .addImage(imageURLTemp: galleryImages);
                  },
                  child: Icon(
                    Icons.add_circle_outline,
                    color: kText2Color.withOpacity(1),
                    size: 0.028 * _height,
                  )),
            ],
          ),
          SizedBox(
            height: _height * 0.01,
          ),
          ListView.separated(
            // physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, i) {
              return AddedImageURLCard(
                imageURL: Provider.of<GalleryItemsList>(context).imageURL[i],
              );
            },
            itemCount: Provider.of<GalleryItemsList>(context).imageURL.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: _height * 0.01,
              );
            },
          ),
          AddBotton(
            text: newEvent
                ? (Locales.currentLocale(context).toString() == "ar"
                    ? "إضافة"
                    : "add")
                : (Locales.currentLocale(context).toString() == "ar"
                    ? "تحديث"
                    : "update"),
            onTap: () {
              if (newEvent) {
                if (Provider.of<GalleryItemsList>(context, listen: false)
                            .galleryTitle !=
                        null &&
                    Provider.of<GalleryItemsList>(context, listen: false)
                            .imageURL !=
                        []) {
                  GalleryDataBaseServices(uid: uid).addNewGalleryData(
                    eventName:
                        Provider.of<GalleryItemsList>(context, listen: false)
                            .galleryTitle,
                    imagesURL:
                        Provider.of<GalleryItemsList>(context, listen: false)
                            .imageURL,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: LocaleText("added success"),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: LocaleText("enter you Info again"),
                  ));
                }
              } else {
                if (Provider.of<GalleryItemsList>(context, listen: false)
                            .galleryTitle !=
                        null &&
                    Provider.of<GalleryItemsList>(context, listen: false)
                            .imageURL !=
                        []) {
                  GalleryDataBaseServices(uid: uid).updateGalleryData(
                    eventName:
                        Provider.of<GalleryItemsList>(context, listen: false)
                            .galleryTitle,
                    imagesURL:
                        Provider.of<GalleryItemsList>(context, listen: false)
                            .imageURL,
                    id: galleryID,
                    context: context,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: LocaleText("updating success"),
                  ));
                } else {
                  Provider.of<GalleryItemsList>(context, listen: false)
                      .imageURL
                      .forEach((element) {
                    print(element);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: LocaleText("enter you Info again"),
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
      builder: (context, galleryItemsList, child) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  height: 0.059018 * _height,
                  width: _width * 0.67,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: kGreyColor.withOpacity(1),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(imageURL),
                ),
                InkWell(
                    onTap: () {
                      galleryItemsList.removeImage(image: imageURL);
                    },
                    child: Icon(
                      Icons.delete_forever,
                      color: kText2Color.withOpacity(1),
                      size: 0.028 * _height,
                    )),
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
