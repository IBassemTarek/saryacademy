import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';

import '../../../models/profileInfoModels/childInfoModel.dart';
import '../../../shared/loading.dart';
import '../../../shared/profilePhoto.dart';
import '../../const.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Consumer<ChildInfoModel>(builder: (_, childInfo, __) {
      if (childInfo.age == null ||
          childInfo.birthday == null ||
          childInfo.email == null ||
          childInfo.gender == null ||
          childInfo.name == null ||
          childInfo.nationality == null ||
          childInfo.photourl == null)
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          height: 0.13392857 * _height,
          width: 0.90338 * _width,
          child: Loading(),
        );
      else
        return Center(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 0.008 * _height,
                  ),
                  Container(
                    height: 0.12392857 * _height,
                    width: 0.90338 * _width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Consumer<ChildInfoModel>(
                                  builder: (context, childInfo, widget) => Text(
                                      childInfo.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          .copyWith(
                                              color: kbackgroundColor
                                                  .withOpacity(1),
                                              fontSize: 34))),
                              Row(
                                children: [
                                  LocaleText('Profile',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                              color: kText1Color.withOpacity(1),
                                              fontSize: 18)),
                                  Image.asset('assets/images/home/arrow.png'),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 0.04831 * _width,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                child: Consumer<ChildInfoModel>(
                    builder: (context, childInfo, widget) =>
                        ProfilePhoto(sizedRatio: 0.14955357)),
              ),
            ],
          ),
        );
    });
  }
}
