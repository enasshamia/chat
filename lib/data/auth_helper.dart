
import 'package:chat_app/models/register_requset.dart';

import 'package:chat_app/provider/routehelper.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential> signup(
      RegisterRequset registerRequset) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: registerRequset.email, password: registerRequset.password);

      return userCredential;
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<UserCredential> login(
      String email, String password,) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
                return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        RouteHelper.routeHelper.showCustomDialoug('User Not Found');
      } else if (e.code == 'wrong-password') {
        RouteHelper.routeHelper.showCustomDialoug('Wrong Password');
      }
    } catch (e) {}
  }

  resetpassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  verfyemail() async {
    await auth.currentUser.sendEmailVerification();
    logout();
  }

  logout() async {
    await auth.signOut();
  }


bool checkUser() {
  return auth.currentUser != null ;
}
String getUser () {
  return auth.currentUser.uid ;
}
}