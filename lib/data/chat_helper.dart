
import 'package:chat_app/models/message.dart';
import 'package:chat_app/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatHelper {
ChatHelper._();
static ChatHelper chatHelper =  ChatHelper._();
FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<List<UserModel>> getAllUsers() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection('Users').get();
    List<UserModel> users =
        querySnapshot.docs.map((e) => UserModel.fromMap(e.data())).toList();
    print(users.length);
    return users;
  }

  Future<DocumentReference<Map<String, dynamic>>> sendMessage(
      MessageModel messageModel) async {
    DocumentReference<Map<String, dynamic>> document =
        await firestore.collection('Chats').add(messageModel.toMap());
    return document;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getChatStream() {
    return firestore.collection('Chats').snapshots();
  }
}