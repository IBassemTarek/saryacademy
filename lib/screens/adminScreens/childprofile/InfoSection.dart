import 'package:flutter/material.dart';
import 'package:saryacademy/shared/adminCustomTextField.dart';
import 'package:saryacademy/shared/reportTitleCard.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final List<Function> onClick;
  final List<String> lable;
  InfoSection({this.title, this.onClick,this.lable});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: 0.036875 * _height,
        ),
        ReportTitleCard(title: title),
        SizedBox(
          height: 0.02897 * _height,
        ),
        DetailsListView(  lable: lable, onClick: onClick),
      ],
    );
  }
}

class DetailsListView extends StatelessWidget {
  const DetailsListView({
    @required this.lable,
    @required this.onClick,
  });

  final List<String> lable;
  final List<Function> onClick;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return Container(
          height: 0.059018 * _height,
          width: 0.7198 * _width,
          child: AdminTextField(
            lableText: lable[i],
            onClick: onClick[i],
            maxLines: 1,
          ),
        );
      },
      itemCount: onClick.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 0.0123 * _height,
        );
      },
    );
  }
}
