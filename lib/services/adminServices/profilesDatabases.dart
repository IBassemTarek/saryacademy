import 'package:saryacademy/models/profileInfoModels/childInfoModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ProfilesDataBaseServices {
  final CollectionReference childInfo = FirebaseFirestore.instance.collection('childInfo');

    List<ChildInfoModel> _kidsDataListSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return ChildInfoModel(
        uid: doc.get("uid"),
          birthday: doc.get("birthday"),
          email: doc.get("email"),
          gender: doc.get("gender"),
          name: doc.get("name"),
          nationality: doc.get("nationality"),
          photourl: doc.get("photourl"),

          reportType: doc.get("reportType")
          ); 
    }).toList();
  }

  // define a stream of data that give response when user login or logout
  Stream<List<ChildInfoModel>> get kidsData {
    return childInfo.snapshots().map(_kidsDataListSnapShot);
  }
}