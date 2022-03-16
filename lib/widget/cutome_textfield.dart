import 'package:chat_app/provider/providerauth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CustomTextfeild extends StatelessWidget {
  String label;

  TextEditingController controller;

  bool isHidden;
  TextInputType textInputType;
  CustomTextfeild(
      {this.label,
      this.controller,
      this.textInputType = TextInputType.text,
      this.isHidden = false});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
      style: TextStyle(color: Colors.grey),
        obscureText: isHidden,
        keyboardType: textInputType,
        controller: this.controller,
        validator: (v) =>
            Provider.of<AuthProvider>(context, listen: false).nullValidate(v),
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.grey)
         ),
      ),
    );
  }
}