import 'package:chat_app/data/auth_helper.dart';
import 'package:chat_app/models/register_requset.dart';
import 'package:chat_app/provider/providerauth.dart';
import 'package:chat_app/ui/register.dart';
import 'package:chat_app/widget/cutome_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LogINPage extends StatefulWidget {
  static  final routename = "login";
  @override
  _LogINPageState createState() => _LogINPageState();
}

class _LogINPageState extends State<LogINPage> {
 

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
                height: size.height * 0.1,
              ),
              Container(
                height: size.height * 0.25,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 100),
                      width: size.width * 0.3,
                      height: size.height * 0.3,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[350].withOpacity(0.3)),
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
              Consumer<AuthProvider>(builder: (context, provider, x){
              return Form(
                   key: provider.loginKey,
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
                    label: 'Password',
                    controller: provider.passwordController,
                    isHidden: true,
                  ),
                        Row(children: [
                          SizedBox(width: size.width*.55,),
                          TextButton(child: Text("Forget Password ?"), onPressed: () {
                           AuthHelper.authHelper.resetpassword(provider.emailController.text);},)
                        ],),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Container(
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(245, 90, 0, 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextButton(
                            child: Text(
                              "Log In",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                                provider.loginUser();
                            }
                             
                          
                          ),
                        ),
                         SizedBox(
                  height: size.height * 0.01,
                ),
                        Container(
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(245, 90, 0, 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextButton(
                            child: Text(
                             'Send Verification Code Again',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              provider.verifyEmail();
                            },
                          ),
                        ),
                        SizedBox(height: size.height*0.2,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text("Dont have an account ?", style: TextStyle(color: Colors.white),),
                          TextButton(child: Text("Register" , style: TextStyle(color: Color.fromRGBO(245, 90, 0, 1))), onPressed: () {
                            Get.to(RegisterPage());
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
