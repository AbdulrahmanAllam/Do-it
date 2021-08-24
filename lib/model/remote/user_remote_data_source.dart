import 'package:do_it_flutter/model/remote/api/apis/user_apis.dart';

import 'api/responses/task_responses/get_tasks_response.dart';
import 'api/responses/user_responses/login_response.dart';
import 'api/responses/user_responses/sign_up_response.dart';

class UserRemoteDataSource {
  UserApis _apis = UserApis();

  void signUp({
    required String userName,
    required String email,
    required String password,
    Function(SignUpResponse)? onSuccess,
    Function(String?, int?)? onResponseError,
    Function(String?)? onError,
    void Function()? onConnectionError,
  }) {
    _apis.signUp(
      userName: userName,
      email: email,
      password: password,
      onSuccess: onSuccess,
      onResponseError: onResponseError,
      onError: onError,
      onConnectionError: onConnectionError,
    );
  }

  void logIn({
    required String email,
    required String password,
    Function(LoginResponse)? onSuccess,
    Function(String?, int?)? onResponseError,
    Function(String?)? onError,
    void Function()? onConnectionError,
  }) {
    _apis.logIn(
        email: email,
        password: password,
        onSuccess: onSuccess,
        onResponseError: onResponseError,
        onError: onError,
        onConnectionError: onConnectionError);
  }
}
