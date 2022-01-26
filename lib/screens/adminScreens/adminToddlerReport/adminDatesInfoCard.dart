import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../models/childUID.dart';
import '../../../services/toddlerPRDatabase.dart';
import '../../../const.dart';
import '../../ToddlerReport/checkIcon.dart';

class AdminDatesInfoCard extends StatelessWidget {
  final String iconUrl;
  final String title;
  final List description;

  AdminDatesInfoCard({this.iconUrl, this.title, this.description});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final uid = Provider.of<ChildModel>(context).uid;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconUrl,
            height: 25,
          ),
          SizedBox(
            width: 0.025 * _width,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LocaleText(title,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: kText4Color.withOpacity(1), fontSize: 12)),
              SizedBox(
                height: 0.01 * _height,
              ),
              Container(
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
                                (Locales.currentLocale(context).toString() ==
                                    "ar"))
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
                                (Locales.currentLocale(context).toString() ==
                                    "ar"))
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
                              return CheckIcon(
                                checked: true,
                              );
                          }),
                          Spacer(),
                          Container(
                            height: 12,
                            width: 55,
                            child: TextFormField(
                                initialValue: description[i],
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        color: Colors.blue[300], fontSize: 12),
                                // controller: (description[i]!=null)?(TextEditingController()..text = description[i]):(TextEditingController()..text = ""),
                                onChanged: (value) {
                                  print(value);
                                  description[i] = value;
                                  ToddlerPRDataBaseServices().updateListText(
                                    list: description,
                                    title: title,
                                    uid: uid,
                                  );
                                }),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, i) => SizedBox(
                          height: 0.005 * _height,
                        ),
                    itemCount: description.length),
              )
            ],
          )
        ],
      ),
    );
  }
}
