import 'package:flutter/material.dart';
import 'package:saryacademy/const.dart';
import 'package:saryacademy/screens/home/profileCard.dart';
import 'package:saryacademy/screens/home/progressReportCard.dart';
import 'package:saryacademy/shared/profilePhoto.dart';

import 'eventsCard.dart';
import 'gallerycard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kbackgroundColor.withOpacity(1),
      body: SingleChildScrollView(
              child: Stack(
          children: [
            Positioned(
                top: _height*0.1216517857,
                right: 0,
                child: Image.asset('assets/images/home/home1.png',width: 0.094866*_height,height:0.094866*_height)
                ),
            Align(
                alignment: Alignment.centerLeft,
                child: Image.asset('assets/images/home/home2.png',width: 0.27483*_width,height:0.2109375*_height)
                ),
            Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset('assets/images/home/home3.png',height:0.2*_height)
                ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 0.14285714*_height,),
                ProfileCard(studentName:'Jana Tarek',profileImageURL:'assets/images/profile/profile.png'),
                SizedBox(height: 0.0391*_height,),
                PRCard(),
                SizedBox(height: 0.064732*_height,),
                GalleryCard(imageURL1: 'assets/images/home/home31.png',imageURL2: 'assets/images/home/home32.png',imageURL3: 'assets/images/home/home33.png',),
                SizedBox(height: 0.07142857*_height,),
                EventsCard()
              ],
            )
          ],
        ),
      ),
    );
  }
}