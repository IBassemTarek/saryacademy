import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/adminMode.dart';
import 'gradeAlert.dart';
import 'gradeCircle.dart';

class GradeIcon extends StatelessWidget {
  GradeIcon({
    @required this.gradeTitle,
    @required this.gradeColor,
    @required this.index,
    @required this.title,
    @required this.mounthNo,
  });
  final String title;
  final int mounthNo;
  final String gradeTitle;
  final Color gradeColor;
  final int index;

  @override
  Widget build(BuildContext context) {
    final isAdmin = Provider.of<AdminMode>(context);
    final _width = MediaQuery.of(context).size.width;

    if (isAdmin.isAdmin)
      return InkWell(
        onTap: () {
          print(index);
          if (index != -1) {
            showDialog(
              context: context,
              builder: (BuildContext context) => GradeAlert(
                context: context,
                index: index,
                title: title,
                mounthNo: mounthNo,
              ),
            );
          }
        },
        child: GradeCircle(
          gradeTitle: gradeTitle,
          gradeColor: gradeColor,
          size: 0.02 * _width,
        ),
      );
    else
      return GradeCircle(
        gradeTitle: gradeTitle,
        gradeColor: gradeColor,
        size: 0.02 * _width,
      );
  }
}
