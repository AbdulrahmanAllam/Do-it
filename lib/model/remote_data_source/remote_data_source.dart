import 'package:do_it_flutter/model/remote_data_source/network/apis/apis.dart';

import 'network/responses/user_responses/login_response.dart';
import 'network/responses/user_responses/register_response.dart';

class RemoteDataSource {
  Apis _apis = Apis();
  void login({
    required String email,
    required String password,
    Function(LoginResponse)? onSuccess,
    Function(String? message, int? code)? onResponseError,
    Function(String? message)? onError,
  }) {
    _apis.logIn(
        email: email,
        password: password,
        onSuccess: onSuccess,
        onResponseError: onResponseError,
        onError: onError);
  }

  void signUp({
    required String userName,
    required String email,
    required String password,
    Function(RegisterResponse)? onSuccess,
    Function(String? message, int? code)? onResponseError,
    Function(String? message)? onError,
  }) {
    _apis.signUp(
        userName: userName,
        email: email,
        password: password,
        onSuccess: onSuccess,
        onResponseError: onResponseError,
        onError: onError);
  }
}
