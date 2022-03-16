import 'package:chat_app/models/register_requset.dart';
import 'package:flutter/material.dart';

class UserModel {
  String id;
  String email;
  String password;
  String userName;
  Gender gender;
  String phoneNumber;
  String city;
  String country;
  String imageUrl;
  UserModel({
    @required this.email,
    @required this.password,
    @required this.userName,
    @required this.gender,
    @required this.phoneNumber,
    @required this.city,
    @required this.country,
  });
  UserModel.fromMap(Map map) {
    this.id = map['id'];
    this.email = map['email'];
    this.userName = map['userName'];
    this.country = map['country'];
    this.city = map['city'];
    this.phoneNumber = map['phone'];
    this.gender = map['gender'] == 'male' ? Gender.male : Gender.female;
    this.imageUrl = map["imageUrl"];
  }
  toMap() {
    return {
      'id': this.id,
      'email': this.email,
      'phone': this.phoneNumber,
      'userName': this.userName,
      'city': this.city,
      'country': this.country,
      'gender': this.gender == Gender.male ? 'male' : 'female',
      "imageUrl" : this.imageUrl 
    };
  }
}