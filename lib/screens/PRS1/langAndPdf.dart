
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saryacademy/shared/pageRouteAnimation.dart';

import '../../../const.dart';

class LangAndPdf extends StatelessWidget {
  final String lang;
  final Widget page;
  LangAndPdf({@required this.lang,this.page});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
    padding: EdgeInsets.all(0.00558*_height),
    decoration: roundedContainer(color: Colors.white,radius: 20.0),
    child: InkWell(
      child: Text(lang,style: Theme.of(context).textTheme.headline1.copyWith( color:kText2Color.withOpacity(1),fontSize: 12)),
                          onTap: (){
                              Navigator.pushReplacement(
                              context,
                              OnBoardingPageRoute(
                              duration: 600,
                              widget: page,
                              myAnimation: Curves.easeInOut),
                                  );
                          },
      ),
                      ),
    Container(
    padding: EdgeInsets.all(0.00558*_height),
    decoration: roundedContainer(color: Colors.white,radius: 5.0),
    child: SvgPicture.asset('assets/images/PR/pdf.svg',height:0.017161*_height),
                      ),
                    ],
                  );
  }
}