
import 'package:chat_app/provider/chatProvider.dart';
import 'package:chat_app/provider/providerauth.dart';
import 'package:chat_app/ui/chat_page.dart';
import 'package:chat_app/ui/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static final routeName = 'HomePage';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false)
                    .editProfileUser();
              },
              icon: Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: PageView(
        controller: Provider.of<ChatProvider>(context).pageController,
        children: [ProfilePage(), ChatPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: Provider.of<ChatProvider>(context).currentPageIndex,
        onTap: (x) {
          Provider.of<ChatProvider>(context, listen: false).changePageIndex(x);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.perm_identity), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
        ],
      ),
    );
  }
}