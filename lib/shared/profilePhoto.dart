import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/profileInfoModels/childInfoModel.dart';

class ProfilePhoto extends StatelessWidget {
  final double sizedRatio;
  ProfilePhoto({this.sizedRatio});

  @override
  Widget build(context) {
    final _height = MediaQuery.of(context).size.height;
    return Container(
      width: _height * sizedRatio,
      height: _height * sizedRatio,
      decoration: new BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: Color(0xffBCBCBC),
        ),
        shape: BoxShape.circle,
        color: Colors.black,
      ),
      child: CircleAvatar(
        backgroundColor: Color(0xffEEEEEE),
        child: ClipOval(
            child: Consumer<ChildInfoModel>(
          builder: (_, childInfo, __) => CachedNetworkImage(
            placeholder: (context, url) => CircularProgressIndicator(),
            imageUrl: childInfo.photourl,
            fit: BoxFit.cover,
            errorWidget: (___, _, __) {
              return Container(
                width: _height * sizedRatio,
                height: _height * sizedRatio,
                child: Image.asset('assets/images/No-Image.png',
                    fit: BoxFit.cover),
              );
            },
          ),
        )),
      ),
    );
  }
}
