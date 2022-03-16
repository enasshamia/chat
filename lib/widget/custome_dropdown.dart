import 'package:chat_app/models/register_requset.dart';
import 'package:chat_app/provider/providerauth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDropDownButton extends StatelessWidget {


 
  // Set<String> genders = {'male', 'female'};
  Gender value = Gender.male;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 1),
      decoration: BoxDecoration(
         
          border: Border(
          
            bottom: BorderSide(width: 1, color: Colors.black),
          ),),
      child: DropdownButton<Gender>(
          isExpanded: true,
          underline: Container(),
          value: Provider.of<AuthProvider>(context).selectedGender,
          onChanged: (e) {
         Provider.of<AuthProvider>(context, listen: false).saveGender(e);
           
          },
          items: Gender.values.map((e) {
            return DropdownMenuItem<Gender>(
              value: e,
              child:
                  Container(child: Text(e == Gender.male ? 'Male' : 'Female' ,style: TextStyle(color: Colors.grey),)),
            );
          }).toList()),
    );
  }
}