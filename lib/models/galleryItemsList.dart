import 'package:flutter/widgets.dart';

class GalleryItemsList extends ChangeNotifier {
  List<String> imageURL = [];
  String galleryTitle = '';
  addImage({String imageURLTemp}) {
    if (imageURLTemp != null) {
      imageURL.add(imageURLTemp);
      notifyListeners();
    }
  }

  changeTitle({String title}) {
    if (title != null) {
      galleryTitle = title;
      notifyListeners();
    }
  }

  removeImage({String image}) {
    imageURL.remove(image);
    notifyListeners();
  }
}
