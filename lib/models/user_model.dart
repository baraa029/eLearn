import 'package:flutter/material.dart';

class Usermodel {
  String id;
  String name;
  String phone;
  String address;
  String email;
  String password;
  bool isAdmin;
  String image;

  Usermodel({
    this.id,
    this.isAdmin,
    this.image,
    @required this.name,
    @required this.phone,
    @required this.address,
    @required this.email,
    @required this.password,
  });
  Usermodel.fromMap(Map map) {
    this.name = map['name'];
    this.phone = map['phone'];
    this.address = map['address'];
    this.email = map['email'];
    this.id = map['id'];
    this.isAdmin = map['isAdmin'] ?? false;
    this.image = map['image'];
  }
  toMap() {
    return {
      'name': this.name,
      'phone': this.phone,
      'address': this.address,
      'email': this.email,
      'image': this.image
    };
  }
}
