import 'package:flutter/material.dart';
import 'package:saryacademy/screens/ToddlerReport/checkIcon.dart';

import '../../const.dart';

class ModesMultipleSelection extends StatelessWidget {
  const ModesMultipleSelection({
    @required this.mood,
  });

  final int mood;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          moods[mood],
          color: kIconColor.withOpacity(1),
          size: 0.03348 * _height,
        ),
        SizedBox(
          width: 0.024155 * _width,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mood",
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
                          CheckIcon(
                            checked: false,
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
                    }
                  },
                  separatorBuilder: (context, i) => SizedBox(
                        width: 0.0531401 * _width,
                      ),
                  itemCount: moods.length),
            )
          ],
        )
      ],
    );
  }
}
