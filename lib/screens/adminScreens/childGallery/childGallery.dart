import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';

import '../../../shared/alertchecker.dart';
import '../../../models/galleryModel.dart';
import '../../../shared/backArrowBotton.dart';
import '../../../const.dart';
import 'addNewGallery.dart';
import 'adminGalleryCard.dart';

class ChildGalleries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    alertcheck(context: context);

    final _gallery = Provider.of<List<GalleryModel>>(context);
    return Scaffold(
      // bottomNavigationBar: BottomBar(widgetName: "EventsPage",),
      backgroundColor: kbackgroundColor.withOpacity(1),
      appBar: AppBar(
        leading: BackArrowBotton(),
        centerTitle: true,
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: LocaleText("Gallery",
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(color: kIconColor.withOpacity(1), fontSize: 30)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: Locales.currentLocale(context).toString() == "ar"
                    ? EdgeInsets.only(
                        right: 0.14975845 * _width, bottom: 0.0145089 * _height)
                    : EdgeInsets.only(
                        left: 0.14975845 * _width, bottom: 0.0145089 * _height),
                alignment: Locales.currentLocale(context).toString() == "ar"
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: LocaleText('Add New',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Colors.white, fontSize: 18))),
            AddNewGallery(newEvent: true),
            SizedBox(
              height: _height * 0.0357143,
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return AdminGalleryCard(
                  index: i,
                );
              },
              itemCount: _gallery.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 0.03 * _height);
              },
            )
          ],
        ),
      ),
    );
  }
}
