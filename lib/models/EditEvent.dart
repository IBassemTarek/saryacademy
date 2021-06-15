import 'package:flutter/widgets.dart';

class EditEvent extends ChangeNotifier {
    String  imageURL; 
    String  title;
    String  text;  

    changeTitle (String  titlex){
      title = titlex;
      notifyListeners();
    }

    changeText (String  textx){
      text = textx;
      notifyListeners();
    } 


    changeImageURL (String  imageURLx){
      imageURL = imageURLx;
      notifyListeners();
    }
}

 