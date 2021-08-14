import 'package:do_it_flutter/model/remote_data_source/network/responses/user_responses/login_response.dart';
import 'package:do_it_flutter/model/remote_data_source/network/responses/user_responses/register_response.dart';

abstract class UserApis {
  void signUp({
    required String userName,
    required String email,
    required String password,
    Function(RegisterResponse)? onSuccess,
    Function(String? message, int? code)? onResponseError,
    Function(String? message)? onError,
  });

  void logIn({
    required String email,
    required String password,
    Function(LoginResponse)? onSuccess,
    Function(String? message, int? code)? onResponseError,
    Function(String? message)? onError,
  });
  void updateProfile();
  void changePassword();
  void updateImage();
  void deleteAccount();
}
