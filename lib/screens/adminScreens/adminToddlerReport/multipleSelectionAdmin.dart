import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saryacademy/screens/ToddlerReport/checkIcon.dart';
import 'package:saryacademy/services/toddlerPRDatabase.dart';

import '../../../const.dart';

class AdminMultipleSelection extends StatelessWidget {
  const AdminMultipleSelection({
    @required this.iconUrl,
    @required this.title,
    @required this.options,
    @required this.currentState,
    @required this.uid,
  });

  final String iconUrl;
  final String title;
  final String uid;
  final int currentState;
  final List<String> options;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(iconUrl),
        SizedBox(
          width: 0.024155 * _width,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LocaleText(title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: kText4Color.withOpacity(1), fontSize: 12)),
            Container(
              height: 0.032366 * _height,
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    if (currentState == i) {
                      return Row(
                        children: [
                          CheckIcon(
                            checked: true,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            options[i],
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(
                                    color: kText4Color.withOpacity(1),
                                    fontSize: 11),
                          ),
                        ],
                      );
                    } else {
                      return InkWell(
                        onTap: () {
                          switch (title) {
                            case 'Meals':
                              ToddlerPRDataBaseServices().updateMeals(
                                meal: i,
                                uid: uid,
                              );
                              break;
                            case 'Diaper':
                              ToddlerPRDataBaseServices().updateDiaper(
                                diaper: i,
                                uid: uid,
                              );
                              break;
                            default:
                          }
                        },
                        child: Row(
                          children: [
                            CheckIcon(
                              checked: false,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              options[i],
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                      color: kText4Color.withOpacity(1),
                                      fontSize: 11),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  separatorBuilder: (context, i) => SizedBox(
                        width: 0.04 * _width,
                      ),
                  itemCount: options.length),
            )
          ],
        ),
      ],
    );
  }
}
