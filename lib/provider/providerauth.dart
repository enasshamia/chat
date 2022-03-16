import 'dart:io';


import 'package:chat_app/data/auth_helper.dart';
import 'package:chat_app/data/firestore_helper.dart';
import 'package:chat_app/data/firestorge_helper.dart';
import 'package:chat_app/models/register_requset.dart';
import 'package:chat_app/models/usermodel.dart';
import 'package:chat_app/provider/routehelper.dart';
import 'package:chat_app/ui/edit_user.dart';
import 'package:chat_app/ui/homepage.dart';
import 'package:chat_app/ui/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    if (checkUser()) {
      getUserFormFirestore(AuthHelper.authHelper.getUser());
    }
    
  }
  
  UserModel userModel;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Gender selectedGender;
  saveGender(Gender gender) {
    this.selectedGender = gender;
    notifyListeners();
  }
   nullValidate(String v) {
    if (v == null || v.length == 0) {
      return 'Required Field';
    }
  }
  editProfileUser() {
    userNameController.text = userModel.userName ;
    countryController.text = userModel.country ;
    cityController.text = userModel.city ;
    phoneController.text = userModel.phoneNumber ;
    RouteHelper.routeHelper.goToPage(EditProfile.routename);
  }
  editptofile() async{
    userModel.userName = userNameController.text ;
     userModel.country =  countryController.text;
     userModel.city = cityController.text;
     userModel.phoneNumber = phoneController.text ;
    await updateUser();
    RouteHelper.routeHelper.goToPage(HomePage.routeName);

  }

  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextStyle headingStyle = TextStyle(fontWeight: FontWeight.w700, fontSize: 25);
  TextStyle bodyStyle = TextStyle(fontSize: 20, color: Colors.blue);
  registerNewUser() async {
    if (registerKey.currentState.validate()) {
      RegisterRequset registerRequest = RegisterRequset(
          city: cityController.text,
          country: countryController.text,
          username: userNameController.text,
          email: emailController.text,
          password: passwordController.text,
          gender: selectedGender,
          phoneNumber: phoneController.text);

      UserCredential userCredential = await signup(registerRequest);
      registerRequest.id = userCredential.user.uid;
      setUserInFirestore(registerRequest);
      getUserFormFirestore(registerRequest.id);
        RouteHelper.routeHelper.goAndReplacePage(HomePage.routeName);
      
      // await verifyEmail();

      // RouteHelper.routeHelper
      //     .showCustomDialoug('please chech your email to verify your account');
    }
  }

  loginUser() async {
    UserCredential userCredential = await login();
    // if (userCredential.user.emailVerified) {
    if (true) {
      getUserFormFirestore(userCredential.user.uid);
      RouteHelper.routeHelper.goAndReplacePage(HomePage.routeName);
    // ignore: dead_code
    } else {
      verifyEmail();
      RouteHelper.routeHelper.showCustomDialoug(
          'sorry, you cant login because your email is not verified');
    }
  
  }

  File file;
  setFile(File file) {
    this.file = file;
    notifyListeners();
  }
  updateUserImage() async {
    XFile file = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file = File(file.path);
    String imageUrl =
        await FireStorageHelper.fireStorageHelper.uploadImage(this.file);
    userModel.imageUrl = imageUrl;
    updateUser();
  }
   Future<UserCredential> signup(RegisterRequset registerRequest) async {
    UserCredential userCredential =
        await AuthHelper.authHelper.signup(registerRequest);
    return userCredential;
  }

  Future<UserCredential> login() async {
    UserCredential userCredential = await AuthHelper.authHelper
        .login(emailController.text, passwordController.text,);
    return userCredential;
  }

  resetPassword(String email) async {
    AuthHelper.authHelper.resetpassword(email);
  }

  verifyEmail() async {
    await AuthHelper.authHelper.verfyemail();
    logout();
  }

  logout() async {
   await AuthHelper.authHelper.logout();
   RouteHelper.routeHelper.goAndReplacePage(LogINPage.routename)
;  }

  getUserFormFirestore(String userId) async {
    this.userModel =
        await FirestoreHelper.firestoreHelper.getUserFromFirestore(userId);
    notifyListeners();
  }

  
setUserInFirestore(RegisterRequset registerRequest) async {
    print(registerRequest.toMap());
    FirestoreHelper.firestoreHelper.saveUserInFirestore(registerRequest);
  
  }

  updateUser() async {
    await FirestoreHelper.firestoreHelper.updateUserFromFirestore(userModel);
    getUserFormFirestore(userModel.id);
  }
  checkUser() {
    return AuthHelper.authHelper.checkUser();
  }
}