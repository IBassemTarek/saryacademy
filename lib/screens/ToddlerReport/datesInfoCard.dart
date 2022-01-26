import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../const.dart';
import 'checkIcon.dart';

class DatesInfoCard extends StatelessWidget {
  final String iconUrl;
  final String title;
  final List<dynamic> description;

  DatesInfoCard({this.iconUrl, this.title, this.description});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    print(title);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconUrl),
          SizedBox(
            width: 0.025 * _width,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: kText4Color.withOpacity(1), fontSize: 12)),
              SizedBox(
                height: 0.01 * _height,
              ),
              Builder(builder: (context) {
                if ((title == 'Nap2') &&
                    (description[0].toString().isEmpty ||
                        description[1].toString().isEmpty))
                  return Container(
                    width: 0.22 * _width,
                    height: 0.043 * _height,
                    child: Text(
                      'Didn\'t take a nap',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: kIconColor.withOpacity(1),
                            fontSize: 12,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  );
                else if (title == 'قيلولة 2' &&
                    (description[0].toString().isEmpty ||
                        description[1].toString().isEmpty))
                  return Container(
                    width: 0.22 * _width,
                    child: Text(
                      'لم تأخذ قيلولة',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: kIconColor.withOpacity(1),
                            fontSize: 12,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  );
                else
                  return Container(
                    width: 0.22 * _width,
                    child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return Row(
                            children: [
                              Builder(builder: (context) {
                                if (title != 'Nap2' &&
                                    title != 'قيلولة 2' &&
                                    title != 'Nap' &&
                                    title != 'قيلولة')
                                  return CheckIcon(
                                    checked: true,
                                  );
                                else if (i == 0 &&
                                    (title == 'قيلولة' || title == 'قيلولة 2'))
                                  return Text(
                                    'من',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                          color: kIconColor.withOpacity(1),
                                          fontSize: 11,
                                        ),
                                  );
                                else if (i == 1 &&
                                    (title == 'قيلولة' || title == 'قيلولة 2'))
                                  return Text(
                                    'إلي',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                          color: kIconColor.withOpacity(1),
                                          fontSize: 11,
                                        ),
                                  );
                                else if (i == 0 &&
                                    (title == 'Nap2' || title == 'Nap'))
                                  return Text(
                                    'from',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                          color: kIconColor.withOpacity(1),
                                          fontSize: 11,
                                        ),
                                  );
                                else if (i == 1 &&
                                    (title == 'Nap2' || title == 'Nap'))
                                  return Text(
                                    'to',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                          color: kIconColor.withOpacity(1),
                                          fontSize: 11,
                                        ),
                                  );
                                else
                                  return Container();
                              }),
                              Spacer(),
                              Text(description[i],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          color: kText4Color.withOpacity(1),
                                          fontSize: 12)),
                            ],
                          );
                        },
                        separatorBuilder: (context, i) => SizedBox(
                              height: 0.005 * _height,
                            ),
                        itemCount: description.length),
                  );
              })
            ],
          )
        ],
      ),
    );
  }
}
