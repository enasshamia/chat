// ignore: import_of_legacy_library_into_null_safe
import 'package:chat_app/models/register_requset.dart';
import 'package:chat_app/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  saveUserInFirestore(RegisterRequset registerRequset) async{
  await  firestore.collection("Users").doc(registerRequset.id).set(registerRequset.toMap()) ;
  }



   Future<UserModel> getUserFromFirestore(String userId) async {
    DocumentSnapshot<Map<String, dynamic>> document =
        await firestore.collection('Users').doc(userId).get();
    Map<String, dynamic> map = document.data();
    UserModel userModel = UserModel.fromMap(map);
    print(userModel.toMap());
    return userModel;
  }

  updateUserFromFirestore(UserModel userModel) async {
    firestore.collection('Users').doc(userModel.id).update(userModel.toMap());
  }
  Future<List<UserModel>> getAllUsers() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection('Users').get();
    List<UserModel> usersList =
        querySnapshot.docs.map((e) => UserModel.fromMap(e.data())).toList();
    return usersList;
  }
}
