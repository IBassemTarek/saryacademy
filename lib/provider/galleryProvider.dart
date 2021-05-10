import 'package:flutter/material.dart';
import 'package:saryacademy/models/galleryModel.dart';

class ProfileProvider with ChangeNotifier {
   
  List<GalleryModel> _childGalleries;

  //getter
  List<GalleryModel> get childGalleriesGetter {
    return [..._childGalleries];
  }

  void addGallery (GalleryModel gallery) {
    _childGalleries.add(gallery);
    notifyListeners();
  }
}