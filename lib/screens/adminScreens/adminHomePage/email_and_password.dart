import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../../screens/adminScreens/adminToddlerReport/smallTextField.dart';
import '../../../screens/adminScreens/childprofile/saveBotton.dart';
import '../../../services/auth.dart';

// ignore: must_be_immutable
class SignUpAlert extends StatelessWidget {
  String email;
  String password;
  final bool add;
  SignUpAlert({this.add});
  @override
  Widget build(BuildContext context) {
    final _auth = AuthService();
    return new AlertDialog(
      title: Text(
        add
            ? (Locales.currentLocale(context).toString() == "ar"
                ? "إضافة مستخدم جديد"
                : 'New Account Info')
            : (Locales.currentLocale(context).toString() == "ar"
                ? "هل أنت متأكد أنك تريد حذف ذلك المستخدم"
                : 'Confirm that you need delete this account'),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "arialRounded",
          fontSize: 21,
          color: Color(0xff041056),
        ),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SmallTextField(
            lableText: Locales.currentLocale(context).toString() == "ar"
                ? "البريد الإليكتروني"
                : "Email",
            onClick: (value) {
              email = value;
            },
            maxLines: 1,
          ),
          Divider(),
          SmallTextField(
            lableText: Locales.currentLocale(context).toString() == "ar"
                ? "كلمة المرور"
                : "Password",
            onClick: (value) {
              password = value;
            },
            maxLines: 1,
          )
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15.0, bottom: 10),
          child: SaveBotton(
            smallBotton: true,
            text: add ? "add" : 'delete',
            onTap: () async {
              if (add == true) {
                try {
                  await _auth.signUp(
                      emailSignIn: email, passwordSignIn: password);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(e.message),
                  ));
                }
              } else {
                await _auth.deleteUser(email: email, password: password);
              }
              Navigator.of(context).pop();
            },
          ),
        )
      ],
    );
  }
}
