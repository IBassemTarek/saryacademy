import 'package:flutter/widgets.dart';

class GalleryItemsList extends ChangeNotifier {
    List<String> imageURL = [];

    addImage ({String imageURLTemp}){
      imageURL.add(imageURLTemp);
      notifyListeners();
    }

    removeImage ({String image}){
      imageURL.remove(image);
      notifyListeners();
    }
}