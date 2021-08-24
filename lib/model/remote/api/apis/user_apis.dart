import 'dart:math';

import 'package:do_it_flutter/model/remote/api/api_services.dart';
import 'package:do_it_flutter/model/remote/api/responses/user_responses/login_response.dart';
import 'package:do_it_flutter/model/remote/api/responses/user_responses/sign_up_response.dart';
import 'package:do_it_flutter/utils/enums/api_methods.dart';

class UserApis {
  void signUp(
      {required String userName,
      required String email,
      required String password,
      Function(SignUpResponse)? onSuccess,
      Function(String?, int?)? onResponseError,
      Function(String?)? onError,
      void Function()? onConnectionError,
      }) {

    Map<String, dynamic> data = {
      "username": "$userName",
      "email": "$email",
      "password": "$password",
    };
    
    ApiServices.sendRequest<SignUpResponse>(
      endpoint: "auth/local/register",
      method: ApiMethods.POST,
      responseObject: SignUpResponse(),
      requestName: "Sign Up",
      data: data,
      onSuccess: onSuccess,
      onResponseError: onResponseError,
      onError: onError,
      onConnectionError: onConnectionError,
    );
  }

  void logIn(
      {required String email,
      required String password,
      Function(LoginResponse)? onSuccess,
      Function(String?, int?)? onResponseError,
      Function(String?)? onError,
      void Function()? onConnectionError,
      }) {

    Map<String, dynamic> data = {
      "identifier": "$email",
      "password": "$password",
    };

    ApiServices.sendRequest<LoginResponse>(
      endpoint: "auth/local",
      method: ApiMethods.POST,
      requestName: "Log In",
      responseObject: LoginResponse(),
      data: data,
      onSuccess: onSuccess,
      onResponseError: onResponseError,
      onError: onError,
      onConnectionError: onConnectionError,
    );
  }

  void updateProfile() {}
  void changePassword() {}
  void updateImage() {}
  void deleteAccount() {}
}
