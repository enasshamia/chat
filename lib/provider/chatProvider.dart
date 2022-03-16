
import 'package:chat_app/data/auth_helper.dart';
import 'package:chat_app/data/chat_helper.dart';
import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  PageController pageController = PageController();
  String getMyId() {
    return AuthHelper.authHelper.getUser();
  }

  int currentPageIndex = 0;
  changePageIndex(int newIndex) {
    pageController.jumpToPage(newIndex);
    this.currentPageIndex = newIndex;
    notifyListeners();
  }

  TextEditingController messageController = TextEditingController();

  sendMessage() {
    MessageModel messageModel =
        MessageModel(messageController.text, AuthHelper.authHelper.getUser());
    ChatHelper.chatHelper.sendMessage(messageModel);
    messageController.clear();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getStream() {
    return ChatHelper.chatHelper.getChatStream();
  }
}