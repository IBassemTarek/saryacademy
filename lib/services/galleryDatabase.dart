import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saryacademy/models/galleryModel.dart';


class GalleryDataBaseServices {
  final CollectionReference galleryCard = FirebaseFirestore.instance.collection('GalleryCard');


final String uid;
  GalleryDataBaseServices({this.uid});

 
    //convert snapshot to list
  List<GalleryModel> _galleryModelListSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return GalleryModel(
        eventName: doc.get("eventName"),
        imagesURL: doc.get("imagesURL"),
        id: doc.get("id"),
        ); 
    }).toList();
  }

  // define a stream of data that give response when user login or logout
  Stream<List<GalleryModel>> get galleryCardsData {
    return galleryCard.doc(uid).collection("ListOfEventCard").snapshots().map(_galleryModelListSnapShot);
  }

  // Future updateUserData(String name, int age, String field) async {
  //   return await profileInfo.doc(uid).set(
  //     {'name': name,
  //      'age': age,
  //       'field': field
  //       });
  // }
  }