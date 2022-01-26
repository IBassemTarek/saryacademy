import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:saryacademy/screens/ToddlerReport/checkIcon.dart';
import 'package:saryacademy/services/toddlerPRDatabase.dart';

import '../../../const.dart';

class AdminModesMultipleSelection extends StatelessWidget {
  const AdminModesMultipleSelection({
    @required this.mood,
    @required this.uid,
  });

  final int mood;
  final String uid;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LocaleText("Mood",
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: kText4Color.withOpacity(1), fontSize: 12)),
        Container(
          height: 0.032366 * _height,
          width: 0.44927537 * _width,
          child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                if (mood == i) {
                  return Row(
                    children: [
                      CheckIcon(
                        checked: true,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        moods[i],
                        color: kText4Color.withOpacity(1),
                        size: 0.0234375 * _height,
                      ),
                    ],
                  );
                } else {
                  return Row(
                    children: [
                      InkWell(
                          onTap: () {
                            ToddlerPRDataBaseServices()
                                .updateMood(mood: i, uid: uid);
                          },
                          child: CheckIcon(
                            checked: false,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        moods[i],
                        color: kText4Color.withOpacity(1),
                        size: 0.0234375 * _height,
                      ),
                    ],
                  );
                }
              },
              separatorBuilder: (context, i) => SizedBox(
                    width: 0.0531401 * _width,
                  ),
              itemCount: moods.length),
        )
      ],
    );
  }
}
