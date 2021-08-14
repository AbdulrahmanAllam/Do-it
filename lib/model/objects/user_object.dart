import 'package:do_it_flutter/utils/log.dart';

class UserObject {
  late int _id;
  late String _token;
  String? _name;
  String? _email;
  String? _image;

  UserObject(
      {required int id,
      required String token,
      String? name,
      String? email,
      String? image}) {
    this.id = id;
    this.token = token;
    this.name = name;
    this.email = email;
    this.image = image;
  }

  String get name => _name ?? "name not found";
  set name(String? value) {
    _name = value;
  }

  String get email => _email ?? "email not found";
  set email(String? value) {
    _email = value;
  }

  String get image => _image ?? "image  not found";
  set image(String? value) {
    _image = value;
  }

  int get id => _id;
  set id(int value) {
    if (value > 0) {
      _id = value;
    } else {
      Log.error("id can't must be more than 0");
    }
  }

  String get token => _token;
  set token(String value) {
    _token = value;
  }
}
