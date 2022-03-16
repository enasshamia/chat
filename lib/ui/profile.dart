import 'package:chat_app/provider/providerauth.dart';
import 'package:chat_app/provider/routehelper.dart';
import 'package:chat_app/ui/edit_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
static final RouteName = "profilePage";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return Scaffold(
      
      body:SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Mask.png"),
              fit: BoxFit.cover,
            ),
          ),child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Consumer<AuthProvider>(
            builder: (context, provider, x) {
              return provider.userModel == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            provider.updateUserImage();
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child: provider.userModel.imageUrl != null
                                ? Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                provider.userModel.imageUrl))),
                                  )
                                : Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      provider.userModel.userName[0]
                                          .toUpperCase(),
                                      style: provider.headingStyle,
                                    ),
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle),
                                  ),
                          ),
                        ),

                        ItemWidget('Email', provider.userModel.email),
                        ItemWidget('UserName', provider.userModel.userName),
                        ItemWidget('Country', provider.userModel.country),
                        ItemWidget('City', provider.userModel.city),
                        ItemWidget('Phone', provider.userModel.phoneNumber),
                      
                      ],
                    );
            },
          ),
        ),
      ),
    ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  String label;
  String content;
  ItemWidget(this.label, this.content);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Provider.of<AuthProvider>(context, listen: false)
                  .headingStyle,
            ),
            Text(
              content,
              style:
                  Provider.of<AuthProvider>(context, listen: false).bodyStyle,
            ),
          ],
        ),
      ),
    );
  }
}