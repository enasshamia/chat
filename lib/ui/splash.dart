
import 'package:chat_app/provider/providerauth.dart';
import 'package:chat_app/provider/routehelper.dart';
import 'package:chat_app/ui/homepage.dart';
import 'package:chat_app/ui/loginpage.dart';
import 'package:chat_app/ui/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    Future.delayed(Duration(seconds: 3)).then((value) {
        bool userExisting =
          Provider.of<AuthProvider>(context, listen: false).checkUser();
      if(userExisting){
        RouteHelper.routeHelper.goAndReplacePage(HomePage.routeName);
      }else {
        RouteHelper.routeHelper.goAndReplacePage(RegisterPage.routename);
      }
    });
    return Scaffold(
      body:Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Mask.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: 
              Center(
                child: Container(
         
                  
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 100),
                        width: size.width * 0.35,

                        height: size.height * 0.35,

                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[350].withOpacity(0.3)),
                        //  child: Image.asset("assets/Mask Group 8.png",) ,
                      ),
                      Positioned.fill(
                        child: Image.asset(
                          "assets/Mask Group 8.png",
                        ),
                        bottom: 150,
                      ),
                      Positioned.fill(
                        child: FittedBox(
                            child: Text(
                          "Daily Recipe",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        )),
                        bottom: 30,
                        left: 0,
                      )
                    ],
                  ),
                ),
              
        
            
          ),

    ),
      );

  }
}