import 'package:do_it_flutter/utils/log.dart';
import 'package:flutter/material.dart';

class UserModel {
  late int _id;
  late String _jwt;
  late String _name;
  late String _email;

  UserModel({required int id, required String jwt, required String name, required String email})
      :_id = id, _jwt = jwt, _name = name, _email = email;

  int get id => _id;
  set id(int value) => _id = value;

  String get jwt => _jwt;
  set jwt(String value) => _jwt = value;

  String get name => _name;
  set name(String value) => _name = value;

  String get email => _email;
  set email(String value) => _email = value;
  
}
