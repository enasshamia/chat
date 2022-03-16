
import 'package:flutter/cupertino.dart';

enum Gender { male, female }
class RegisterRequset {
  String id ;
  String email ; 
  String password ;
  String username ;
  Gender gender;
  String phoneNumber;
  String city;
  String country;
RegisterRequset({@required this.email ,@required this.password ,@required this.username , @required this.gender,
    @required this.phoneNumber,
    @required this.city,
    @required this.country,});
     toMap() {
    return {
      "id" :this.id ,
      'email': this.email,
      'phone': this.phoneNumber,
      'userName': this.username,
      'city': this.city,
      'country': this.country,
      'gender': this.gender == Gender.male ? 'male' : 'female'
    };
     }
}