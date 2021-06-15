import 'package:flutter/widgets.dart';

class IsEmptyModel extends ChangeNotifier {
  bool galleryIsEmpty;
  bool eventIsEmpty;
  changeGallerystate(bool state) {
    galleryIsEmpty = state;
    notifyListeners();
  }
  changeEventstate(bool state) {
    eventIsEmpty = state;
    notifyListeners();
  }
}