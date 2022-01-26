import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../const.dart';

class EventsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Center(
          child: Column(
            children: [
              SizedBox(
                height: 0.02392857 * _height,
              ),
              Container(
                height: 0.12392857 * _height,
                width: 0.90338 * _width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                child: Align(
                  alignment: Alignment.center,
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
                          LocaleText("Events",
                              style: Locales.currentLocale(context)
                                          .toString() ==
                                      "en"
                                  ? Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .copyWith(
                                          color:
                                              kbackgroundColor.withOpacity(1),
                                          fontSize: 34)
                                  : Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(
                                          color:
                                              kbackgroundColor.withOpacity(1),
                                          fontSize: 30)),
                          Row(
                            children: [
                              LocaleText('Enter',
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
        ),
        Center(
          child: Row(
            children: [
              SizedBox(
                width: Locales.currentLocale(context).toString() == "en"
                    ? 0.6 * _width
                    : 0.5 * _width,
              ),
              Image.asset(
                'assets/images/home/home41.png',
                height: 0.210 * _height,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
