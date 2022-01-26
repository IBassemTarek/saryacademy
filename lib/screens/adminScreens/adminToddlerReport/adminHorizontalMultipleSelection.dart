import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saryacademy/screens/ToddlerReport/checkIcon.dart';
import 'package:saryacademy/services/toddlerPRDatabase.dart';

import '../../../const.dart';

class AdminVerticalMultipleSelection extends StatelessWidget {
  const AdminVerticalMultipleSelection({
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
    return Container(
      height: 0.1015625 * _height,
      width: 0.38405797 * _width,
      decoration: roundedContainer(color: Colors.white, radius: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconUrl,
            height: 25,
            width: 25,
          ),
          SizedBox(
            width: 0.024155 * _width,
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
                            ToddlerPRDataBaseServices().updateplayoutside(
                              playoutside: i == 0 ? false : true,
                              uid: uid,
                            );
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
                          height: 0.005 * _height,
                        ),
                    itemCount: options.length),
              )
            ],
          ),
        ],
      ),
    );
  }
}
