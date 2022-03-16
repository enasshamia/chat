import 'dart:ui';

import 'package:chat_app/data/auth_helper.dart';
import 'package:chat_app/models/register_requset.dart';
import 'package:chat_app/provider/providerauth.dart';
import 'package:chat_app/ui/loginpage.dart';
import 'package:chat_app/widget/custome_dropdown.dart';
import 'package:chat_app/widget/cutome_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  static final routename= "registerpage";
  RegisterRequset registerRequset;
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  




  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
       
          CircularProgressIndicator(),
          Container(
          margin: EdgeInsets.only(left: 15), child: FittedBox(child: Text("سوف يتم ارسال رسالة تأكيد على البريد الالكتروني .." ,style: TextStyle(fontSize: 12),))),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Mask.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Center(
                child: Container(
         
                  height: size.height * 0.23,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 100),
                        width: size.width * 0.3,

                        height: size.height * 0.3,

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
                              fontSize: 20),
                        )),
                        bottom: 30,
                        left: 0,
                      )
                    ],
                  ),
                ),
              ),
               Consumer<AuthProvider>(builder: (context, provider, x) {
             return  Form(
                key: provider.registerKey,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        CustomTextfeild(
                  label: 'Email',
                  controller: provider.emailController,
                  textInputType: TextInputType.emailAddress,
                ),
                          CustomTextfeild(
                  label: 'password',
                  controller: provider.passwordController,
                  textInputType: TextInputType.emailAddress,
                ),
                          CustomTextfeild(
                  label: 'UserNmae',
                  controller: provider.userNameController,
                  textInputType: TextInputType.emailAddress,
                ),
                          CustomTextfeild(
                  label: 'city',
                  controller: provider.cityController,
                  textInputType: TextInputType.text,
                ),
                   CustomTextfeild(
                  label: 'country',
                  controller: provider.countryController,
                  textInputType: TextInputType.text,
                ),
                        CustomDropDownButton() ,
                           CustomTextfeild(
                  label: 'phone',
                  controller: provider.phoneController,
                  textInputType: TextInputType.phone,
                ),
                      SizedBox(height: size.height*0.05,),
                        Container(
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(245, 90, 0, 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextButton(
                            child: Text(
                              "Register",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                       provider.registerNewUser();
                            }  
                          
                          ),
                        ),
                         SizedBox(height: size.height*0.05,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text(" Have an account ?", style: TextStyle(color: Colors.white),),
                          TextButton(child: Text("Login" , style: TextStyle(color: Color.fromRGBO(245, 90, 0, 1))), onPressed: () {
                            Get.to(LogINPage());
                          },)
                        ],)
                        
                      ],
                    ),
                  ),
                );
               }
              )
            ],
          )),
    ));
  }
}
