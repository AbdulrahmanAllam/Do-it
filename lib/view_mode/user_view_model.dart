import 'package:do_it_flutter/model/models/user_model.dart';
import 'package:do_it_flutter/model/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  _message({required BuildContext context, required String text}) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("$text")));
  }

  void _onAuthSuccess(
      {required UserModel user,
      required BuildContext context,
      required String nextPageRoute}) {
    _repository.saveUser(user: user).then((value) {
      Navigator.pushReplacementNamed(context, nextPageRoute);
    });
  }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "this field is required";
    } else {
      bool emailValid = RegExp(r"[a-zA-Z0-9_-]+@[a-z]+\.[a-z]").hasMatch(email);
      if (!emailValid || email.contains(" ")) {
        return "email not valid";
      }
    }
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "this field is required";
    } else if (password.length < 6) {
      return "password length must be 6 or more";
    }
  }

  String? validateUserName(String? userName) {
    if (userName == null || userName.isEmpty) {
      return "this field is required";
    }
  }

  void logIn({required BuildContext context, required String nextPageRoute}) {
    if (_formValidate()) {
      _repository.logIn(
          email: _email!,
          password: _password!,
          onSuccess: (response) {
            UserModel user = UserModel(
              id: response.user!.id!,
              jwt: response.jwt!,
              name: response.user!.username!,
              email: response.user!.email!,
            );
            _onAuthSuccess(
                user: user, context: context, nextPageRoute: nextPageRoute);
          },
          onResponseError: (error, errorCode) {
            if (errorCode == 400) {
              _message(context: context, text: "email or password are false");
            }
          },
          onError: (error) {
            _message(context: context, text: "something wrong happened");
          },
          onConnectionError: () => _message(context: context, text: "check your connection")
          );
    }
  }

  void signUp({required BuildContext context, required String nextPageRoute}) {
    if (_formValidate()) {
      _repository.signUp(
          userName: _userName!,
          email: _email!,
          password: _password!,
          onSuccess: (response) {
            UserModel user = UserModel(
              id: response.user!.id!,
              jwt: response.jwt!,
              name: response.user!.username!,
              email: response.user!.email!,
            );
            _onAuthSuccess(
                user: user, context: context, nextPageRoute: nextPageRoute);
          },
          onResponseError: (error, errorCode) {
            if (errorCode == 400) {
              _message(
                  context: context, text: "username or email are already used");
            }
          },
          onError: (error) {
            _message(context: context, text: "something wrong happened");
          },
          onConnectionError: () => _message(context: context, text: "check your connection")
          );
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
