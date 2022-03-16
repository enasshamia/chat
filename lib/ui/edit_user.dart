
import 'package:chat_app/provider/providerauth.dart';
import 'package:chat_app/widget/cutome_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
 
static final routename = "editPrrofile";

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile"),),
      body:  Consumer<AuthProvider>(builder: (context, provider, x) {
             return   Container(
               
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Mask.png"),
              fit: BoxFit.cover,
            ),
          ),
                 child: Container(
                     margin:EdgeInsets.symmetric(vertical: size.height*0.15),
                   child: Form(
      
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                      
                              
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
                             
                                 CustomTextfeild(
                        label: 'phone',
                        controller: provider.phoneController,
                        textInputType: TextInputType.phone,
                      ),
                            SizedBox(height: size.height*0.1,),
                              Container(
                                width: size.width * 0.8,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(245, 90, 0, 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextButton(
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                             provider.editptofile();
                                  }  
                                
                                ),
                              ),
                        
                            ]
                          ),
      
                        ),
                   
                   
                        
      

      ),
                 ),
               
             );
      }


      )
      );
    

                    
    
  }
}