import 'package:cloud_firestore/cloud_firestore.dart';

import 'childName.dart';


class ProfilesIndexBaseServices {
  final CollectionReference childInfo = FirebaseFirestore.instance.collection('childInfo');

    List<ChildIndex> _kidsIndexListSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return ChildIndex(
        uid: doc.get("uid"),
          name: doc.get("name"),
          ); 
    }).toList();
  }

  // define a stream of data that give response when user login or logout
  Stream<List<ChildIndex>> get kidsIndex {
    return childInfo.snapshots().map(_kidsIndexListSnapShot);
  }
}