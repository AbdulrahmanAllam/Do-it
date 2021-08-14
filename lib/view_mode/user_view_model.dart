import 'package:do_it_flutter/model/objects/user_object.dart';
import 'package:do_it_flutter/model/repository.dart';
import 'package:flutter/cupertino.dart';

class UserViewModel extends ChangeNotifier {
  final Repository _repository = Repository();
  final _formKey = GlobalKey<FormState>();
  String? _userName;
  String? _email;
  String? _password;

  bool _formValidate() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      return true;
    } else {
      return false;
    }
  }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "this field is required";
    } else {
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      if (!emailValid) {
        return "email not valid";
      }
    }
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "this field is required";
    } else if (password.length < 6) {
      return "password length must be more than 6";
    }
  }

  String? validateUserName(String? userName) {
    if (userName == null || userName.isEmpty) {
      return "this field is required";
    } else if (userName.length < 2) {
      return "user name length must be more than 2";
    }
  }

  void login({required BuildContext context, required String route}) {
    if (_formValidate()) {
      _repository.login(
          email: _email!,
          password: _password!,
          onSuccess: (response) {
            UserObject user =
                UserObject(id: response.user!.id!, token: response.jwt!);
            _repository.saveUser(user).then(
                (value) => Navigator.pushReplacementNamed(context, route));
          });
    }
  }

  void signUp({required BuildContext context, required String route}) {
    if (_formValidate()) {
      _repository.signUp(
          userName: _userName!,
          email: _email!,
          password: _password!,
          onSuccess: (response) {
            UserObject user =
                UserObject(id: response.user!.id!, token: response.jwt!);
            _repository.saveUser(user).then(
                (value) => Navigator.pushReplacementNamed(context, route));
          });
    }
  }

  get formKey => _formKey;

  set userName(String? value) {
    _userName = value;
  }

  set email(String? value) {
    _email = value;
  }

  set password(String? value) {
    _password = value;
  }
}
