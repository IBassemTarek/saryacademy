import 'package:flutter/material.dart';

import '../const.dart';

class AdminTextField extends StatelessWidget {
  final String lableText;
  final Function onClick;
  final int maxLines;
  final initialData;
  AdminTextField(
      {@required this.onClick,
      @required this.lableText,
      this.maxLines,
      this.initialData});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: lableText == "report type"
          ? TextInputType.number
          : TextInputType.multiline,
      onChanged: onClick,
      initialValue: initialData == null ? null : initialData,
      maxLines: maxLines == null ? 1 : maxLines,
      style: Theme.of(context)
          .textTheme
          .bodyText1
          .copyWith(color: Colors.blue[300], fontSize: 18),
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 6),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kGreyColor.withOpacity(1),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kGreyColor.withOpacity(1),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelText: lableText,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(color: Colors.black.withOpacity(0.5), fontSize: 14),
        labelStyle: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(color: Colors.grey, fontSize: 14),
      ),
      obscureText: lableText == 'Password' ? true : false,
      //  onChanged: (value){},
    );
  }
}
