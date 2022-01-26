import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../const.dart';

class GalleryCard extends StatelessWidget {
  final String imageURL2;
  final String imageURL1;
  final String imageURL3;
  GalleryCard({this.imageURL2, this.imageURL1, this.imageURL3});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        height: 0.12392857 * _height,
        width: 0.90338 * _width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 0.07 * _width,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                LocaleText("Gallery",
                    style: Locales.currentLocale(context).toString() == "en"
                        ? Theme.of(context).textTheme.headline1.copyWith(
                            color: kbackgroundColor.withOpacity(1),
                            fontSize: 34)
                        : Theme.of(context).textTheme.subtitle2.copyWith(
                            color: kbackgroundColor.withOpacity(1),
                            fontSize: 30)),
                Row(
                  children: [
                    LocaleText("Enter",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: kText1Color.withOpacity(1), fontSize: 18)),
                    Image.asset('assets/images/home/arrow.png'),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 0.01339 * _width,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(imageURL1, height: 0.048549 * _height),
                    Image.asset(imageURL2, height: 0.048549 * _height),
                  ],
                ),
                Image.asset(
                  imageURL3,
                  height: 0.10033482 * _height,
                  width: 0.3 * _width,
                ),
              ],
            ),
            SizedBox(
              width: 0.0193 * _width,
            ),
          ],
        ),
      ),
    );
  }
}
