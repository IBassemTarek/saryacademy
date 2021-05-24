import 'package:firebase_auth/firebase_auth.dart';
import 'package:saryacademy/models/user.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  UserModel userFromFirebaseUser(user) {
    return user != null ? UserModel(id: user.uid) : null;
  }


  Stream<UserModel> get user {
    return auth.authStateChanges().map(userFromFirebaseUser);
  }

  Future signIn(emailSignIn, passwordSignIn) async {
      var authResult = await auth.signInWithEmailAndPassword(
          email: emailSignIn, password: passwordSignIn);
      return authResult.user;
  }

  Future signOut() async {
    try {
      return await auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
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