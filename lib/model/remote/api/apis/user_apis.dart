import 'dart:convert';
import 'dart:math';

import 'package:do_it_flutter/model/remote/api/api_services.dart';
import 'package:do_it_flutter/model/remote/api/http_services.dart';
import 'package:do_it_flutter/model/remote/api/responses/user_responses/login_response.dart';
import 'package:do_it_flutter/model/remote/api/responses/user_responses/sign_up_response.dart';
import 'package:do_it_flutter/utils/enums/api_methods.dart';

class UserApis {
  HttpServices _httpServices = HttpServices();
  void signUp({
    required String userName,
    required String email,
    required String password,
    Function(SignUpResponse)? onSuccess,
    Function(int?)? onError,
    void Function()? onConnectionError,
  }) {
    Map<String, dynamic> body = {
      "username": "$userName",
      "email": "$email",
      "password": "$password",
    };

    _httpServices.post(
      endpoint: "auth/local/register",
      requestName: "Sign Up",
      body: body,
      onSuccess: (response){
        if(onSuccess != null){
          Map<String, dynamic> json = jsonDecode(response);
          SignUpResponse signUpResponse = SignUpResponse.fromJson(json);
          onSuccess(signUpResponse);
        }
      },
      onError: onError,
      onConnectionError: onConnectionError,
    );
  }

  void logIn({
    required String email,
    required String password,
    Function(LoginResponse)? onSuccess,
    Function(int?)? onError,
    void Function()? onConnectionError,
  }) {
    Map<String, dynamic> body = {
      "identifier": "$email",
      "password": "$password",
    };

    _httpServices.post(
      endpoint: "auth/local",
      requestName: "Log In",
      body: body,
      onSuccess: (response) {
        if (onSuccess != null) {
          Map<String, dynamic> json = jsonDecode(response);
          LoginResponse loginResponse = LoginResponse.fromJson(json);
          onSuccess(loginResponse);
        }
      },
      onError: onError,
      onConnectionError: onConnectionError,
    );
  }

  void updateProfile() {}
  void changePassword() {}
  void updateImage() {}
  void deleteAccount() {}
}
