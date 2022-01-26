import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';

import '../../../models/childUID.dart';
import '../../../services/adminServices/childName.dart';
import '../../../shared/alertchecker.dart';
import '../../../screens/adminScreens/childHome/childHome.dart';
import '../../../shared/pageRouteAnimation.dart';
import '../../../shared/signOut.dart';
import '../../../const.dart';
import 'email_and_password.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    alertcheck(context: context);
    return Scaffold(
      floatingActionButton: Container(
        width: _width * 0.4,
        padding: EdgeInsets.symmetric(vertical: _height * 0.01),
        decoration: BoxDecoration(
          color: kGreyColor.withOpacity(1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: () {
            if (Locales.currentLocale(context).toString() == "en")
              LocaleNotifier.of(context).change("ar");
            else
              LocaleNotifier.of(context).change("en");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Locales.currentLocale(context).toString() == "ar"
                    ? "assets/images/flags/EN.png"
                    : "assets/images/flags/EG.png",
                height: _height / 40,
              ),
              SizedBox(
                width: _width / 20,
              ),
              LocaleText(
                "lang",
                style:
                    TextStyle(color: kText1Color.withOpacity(1), fontSize: 22),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 0.068 * _width,
            right: 0.068 * _width,
            top: 0.0123 * _height,
            bottom: 0.0923 * _height,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 0.0173 * _height),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LocaleText("Profiles",
                        style: Theme.of(context).textTheme.headline1.copyWith(
                            color: kbackgroundColor.withOpacity(1),
                            fontSize: 36)),
                    SignOut()
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => SignUpAlert(
                      add: true,
                    ),
                  );
                },
                child: Align(
                  alignment: Locales.currentLocale(context).toString() == "ar"
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    width: 0.7198 * _width,
                    height: 0.029 * _height,
                    alignment: Locales.currentLocale(context).toString() == "ar"
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    padding: Locales.currentLocale(context).toString() == "ar"
                        ? EdgeInsets.only(right: 0.038 * _width)
                        : EdgeInsets.only(left: 0.038 * _width),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: kText1Color.withOpacity(1),
                    ),
                    child: LocaleText(
                      'Add New Child',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0.01657 * _height),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Consumer<List<ChildIndex>>(
                  builder: (context, profiles, _) => ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return Row(
                        children: [
                          Container(
                            width: 0.7198 * _width,
                            height: 0.029 * _height,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 0.038 * _width),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                    color: kGreyColor.withOpacity(1))),
                            child: Text(
                              profiles[i].name,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                      color: kText1Color.withOpacity(1),
                                      fontSize: 18),
                            ),
                          ),
                          SizedBox(width: 0.010 * _width),
                          InkWell(
                            onTap: () {
                              Provider.of<ChildModel>(context, listen: false)
                                  .changeChildID(profiles[i].uid);
                              Navigator.push(
                                context,
                                OnBoardingPageRoute(
                                    duration: 600,
                                    widget: AdminHome(),
                                    myAnimation: Curves.easeInOut),
                              );
                            },
                            child: Icon(Icons.edit,
                                size: 0.0486 * _width,
                                color: kGreyColor.withOpacity(1)),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () async {
                              // deleteUser
                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    SignUpAlert(add: false),
                              );
                            },
                            child: Icon(Icons.person_remove_alt_1,
                                size: 0.0486 * _width,
                                color: kGreyColor.withOpacity(1)),
                          )
                        ],
                      );
                    },
                    itemCount: profiles.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: 0.01857 * _height),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
