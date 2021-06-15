import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/galleryModel.dart';
import 'package:saryacademy/models/isEmpty.dart';


class GalleryDataBaseServices {
  final CollectionReference galleryCard = FirebaseFirestore.instance.collection('GalleryCard');

 

final String uid;
  GalleryDataBaseServices({this.uid});

  Future checkIfEmpty({BuildContext context}) async {
    final isEmpty = Provider.of<IsEmptyModel>(context);
    final snapshot =  galleryCard.doc(uid).collection("ListOfGalleryCard").snapshots();
    bool x = await snapshot.isEmpty;
    if ( x ) {
        isEmpty.changeGallerystate(true); 
        return true;
    }
    else 
    {
      isEmpty.changeGallerystate(false);
 
      return false;
      
    }
    

  }
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
    return galleryCard.doc(uid).collection("ListOfGalleryCard").snapshots().map(_galleryModelListSnapShot);
  }

  Future updateGalleryData({ String eventName, List  imagesURL,String id, BuildContext context} ) async {
    return await galleryCard.doc(uid).collection("ListOfGalleryCard").doc(id).update(
      {'imagesURL': imagesURL,
       'eventName': eventName, 
       'id' : id, 
        }).then((value) {
            print("Gallery added");
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("Gallery updated"),
                                   ));
        }).catchError((error) => print("Failed to add Gallery: $error"));
  }
  void initGallery() async {
    await galleryCard.doc(uid).collection("ListOfGalleryCard").get();
  }
  Future addNewGalleryData({String eventName, List  imagesURL}) async {
    return await galleryCard.doc(uid).collection("ListOfGalleryCard").doc(eventName).set(
      {'imagesURL': imagesURL,
       'eventName': eventName, 
       'id' : eventName, 
        }).then((value) => print("Gallery added"))
    .catchError((error) => print("Failed to add Gallery: $error"));
  }

Future<void> deleteGallery(String id) {
  return galleryCard.doc(uid).collection("ListOfGalleryCard")
    .doc(id)
    .delete()
    .then((value) => print("Gallery Deleted"))
    .catchError((error) => print("Failed to delete Gallery: $error"));
}
  }