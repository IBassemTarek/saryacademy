import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/childUID.dart';
import '../../../screens/adminScreens/childHome/childHome.dart';
import '../../../shared/pageRouteAnimation.dart';

import '../../../models/profileInfoModels/childInfoModel.dart';
import '../../../shared/backArrowBotton.dart';
import '../../../shared/signOut.dart';
import '../../../const.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: BackArrowBotton(),
        actions: [
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                right: 0.05 * _width,
              ),
              child: SignOut())
        ],
        centerTitle: false,
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Profiles",
            style: Theme.of(context).textTheme.headline1.copyWith(
                color: kbackgroundColor.withOpacity(1), fontSize: 36)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: 0.068 * _width, vertical: 0.0123 * _height),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 0.7198 * _width,
                height: 0.029 * _height,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 0.038 * _width),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: kText1Color.withOpacity(1),
                ),
                child: Text(
                  'Add New Child',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 0.01657 * _height),
            Consumer<List<ChildInfoModel>>(
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
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border:
                                Border.all(color: kGreyColor.withOpacity(1))),
                        child: Text(
                          profiles[i].name,
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: kText1Color.withOpacity(1), fontSize: 18),
                        ),
                      ),
                      SizedBox(width: 0.010 * _width),
                      InkWell(
                        onTap: () {
                          Provider.of<ChildModel>(context,listen: false).changeChildID(profiles[i].uid);
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
          ],
        ),
      ),
    );
  }
}