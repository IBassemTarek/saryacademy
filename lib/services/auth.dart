import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../../../models/user.dart';
import '../../../services/PRM2Database.dart';
import '../../../services/PRM3Database.dart';
import '../../../services/profileDatabase.dart';
import '../../../services/toddlerPRDatabase.dart';
import 'eventsDatabase.dart';
import 'galleryDatabase.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel userFromFirebaseUser(user) {
    return user != null ? UserModel(id: user.uid) : null;
  }


  Stream<UserModel> get user {
    return _auth.authStateChanges().map(userFromFirebaseUser);
  }

  Future signIn(emailSignIn, passwordSignIn) async {
      var authResult = await _auth.signInWithEmailAndPassword(
          email: emailSignIn, password: passwordSignIn);
      return authResult.user;
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  } 
Future deleteUser({String email, String password}) async {
    try {
      User user = _auth.currentUser;
      AuthCredential credentials =
          EmailAuthProvider.credential(email: email, password: password);
      print(user);
      UserCredential result = await user.reauthenticateWithCredential(credentials); 


      await ProfileDataBaseServices(uid: result.user.uid).deleteParent();
      await ProfileDataBaseServices(uid: result.user.uid).deleteChild(); 
      await ProfileDataBaseServices(uid: result.user.uid).deletevaccinationCard(); 
      await ProfileDataBaseServices(uid: result.user.uid).deletemedicalHistoryCard(); 
      await ProfileDataBaseServices(uid: result.user.uid).deleteabsenceCard(); 


      await ToddlerPRDataBaseServices(uid: result.user.uid).deletetoddlerPR(); 
 

      await PRM2DataBaseServices(uid: result.user.uid).deleteprMounth1();
      await PRM2DataBaseServices(uid: result.user.uid).deleteprMounth2();
      await PRM2DataBaseServices(uid: result.user.uid).deleteprMounth3();
      await PRM2DataBaseServices(uid: result.user.uid).deleteprm2();

      await PRM3DataBaseServices(uid: result.user.uid).deleteprMounth1();
      await PRM3DataBaseServices(uid: result.user.uid).deleteprMounth2();
      await PRM3DataBaseServices(uid: result.user.uid).deleteprMounth3();
      await PRM3DataBaseServices(uid: result.user.uid).deleteprm2(); 


       await EventDataBaseServices(uid: result.user.uid).deleteeventCard();   
 
       await GalleryDataBaseServices(uid: result.user.uid).deletegalleryCard();       
      await result.user.delete();
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }



  Future signUp({emailSignIn, passwordSignIn}) async {
    try { 
      var authResult = await _auth.createUserWithEmailAndPassword(
          email: emailSignIn, password: passwordSignIn); 
            if (authResult.user != null) { 
              UserModel user = userFromFirebaseUser(authResult.user);
              print(user.id); 
          ProfileDataBaseServices(uid: user.id).initChildInfo(
            age: "",
            birthday: "",
            email: emailSignIn,
            gender: "",
            name: "",
            nationality: "",
            photourl: "",
            reportType: 1
          );
          ProfileDataBaseServices(uid: user.id).initParentInfo(
            address: "",
            fatherOcc: "",
            matherOcc: "",
            phone: "",
          );
          ProfileDataBaseServices(uid: user.id).initMedicalInfo(
            note: "",
            symptom: "",
          );
          ProfileDataBaseServices(uid: user.id).initVaccinationInfo(
            date: "",
            vaccination: ""
          );
          ProfileDataBaseServices(uid: user.id).initAbsenceInfo(
            days: "",
            month: ''
          ); 
          ToddlerPRDataBaseServices(uid: user.id).initToddlerReport(
            childName:"",
            dateE:  "date",
            dateA: "اليوم",
            presence: false,
            mood: 0,
            pdf: "",
            naps: ["",""],
            activities: ["",""],
            notes: ["",""],
            meals: [false,false],
            fluid: [true,false],
            diaper: ["",""],
            restroom: [true,false],
            clothes: ["",""],
          );
          PRM2DataBaseServices(uid: user.id).initprMounth1(
              personalDevelopment: [0,0,0],
              physicalDevelopment:  [0,0,0,0,0,0,0,0,0,0],
              socialSkills: [0,0,0,0,0,0,0,]
          );
          PRM2DataBaseServices(uid: user.id).initprMounth2(
              personalDevelopment: [0,0,0],
              physicalDevelopment:  [0,0,0,0,0,0,0,0,0,0],
              socialSkills: [0,0,0,0,0,0,0,]
          );
          PRM2DataBaseServices(uid: user.id).initprMounth3(
              personalDevelopment: [0,0,0],
              physicalDevelopment:  [0,0,0,0,0,0,0,0,0,0],
              socialSkills: [0,0,0,0,0,0,0,]
          );
          PRM2DataBaseServices(uid: user.id).initprm2(
              month1A: "شهر 1",
              month1E: "month1",
              month2A: "شهر 2",
              month2E: "month2",
              month3A: "شهر 3",
              month3E: "month3",
              pdf: "",
              studentNameA: "",
              studentNameE: "",
          );
          PRM3DataBaseServices(uid: user.id).initprm3(
              month1A: "شهر 1",
              month1E: "month1",
              month2A: "شهر 2",
              month2E: "month2",
              month3A: "شهر 3",
              month3E: "month3",
              pdf: "",
              studentNameA: "",
              studentNameE: "",
          );
          PRM3DataBaseServices(uid: user.id).initpr2Mounth1(
  personalDevelopment: [0,0,0,0,0],
  physicalDevelopment:  [0,0,0,0,0,0,0,0,0,0],
  socialSkills: [0,0,0,0,0,0,0,0,0,0,0,0,0]
          );
          PRM3DataBaseServices(uid: user.id).initpr2Mounth2(
  personalDevelopment: [0,0,0,0,0],
  physicalDevelopment:  [0,0,0,0,0,0,0,0,0,0],
  socialSkills: [0,0,0,0,0,0,0,0,0,0,0,0,0]
          );
          PRM3DataBaseServices(uid: user.id).initpr2Mounth3(
  personalDevelopment: [0,0,0,0,0],
  physicalDevelopment:  [0,0,0,0,0,0,0,0,0,0],
  socialSkills: [0,0,0,0,0,0,0,0,0,0,0,0,0]
          );
          EventDataBaseServices(uid: user.id).initeventCard(
            date: Timestamp.now(),
            imageURL: "",
            text: "",
            title: ""
          );
          GalleryDataBaseServices(uid: user.id).initGalleryCard(
            eventName: "",
            imagesURL: ["",""]
          );
          return userFromFirebaseUser(user);
            }
            else 
            print("null");
 
    }  on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      }
else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
        } catch (e) {
      print(e);
    }
  }

  // Future signUp(emailSignUp, passwordSignUp) async {
  //   try {
  //     User user = (await auth.createUserWithEmailAndPassword(
  //         email: emailSignUp, password: passwordSignUp) as User);
  //     _userFromFirebaseUser(user);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       print('The password provided is too weak.');
  //     } else if (e.code == 'email-already-in-use') {
  //       print('The account already exists for that email.');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}