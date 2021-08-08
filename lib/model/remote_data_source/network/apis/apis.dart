import 'package:do_it_flutter/model/remote_data_source/network/apis/user_apis.dart';
import 'package:do_it_flutter/model/remote_data_source/network/responses/user_responses/login_response.dart';
import 'package:do_it_flutter/model/remote_data_source/network/responses/user_responses/register_response.dart';
import 'package:do_it_flutter/utils/enums/network_methods.dart';
import '../network_services.dart';

class Apis implements UserApis{
  @override
  void changePassword() {
    // TODO: implement changePassword
  }

  @override
  void deleteAccount() {
    // TODO: implement deleteAccount
  }

  @override
  void logIn({
    required String email,
    required String password,
    Function(LoginResponse)? onSuccess,
    Function(String? message, int? code)? onResponseError,
    Function(String? message)? onError,
  }) {
    Map<String, String> data = {
      "identifier": "$email",
      "password": "$password",
    };
    NetworkServices.sendRequest<LoginResponse>(
      responseType: LoginResponse(),
      endpoint: "auth/local",
      method: NetworkMethods.POST,
      requestName: "login",
      data: data,
      onSuccess: onSuccess,
      onResponseError: onResponseError,
      onError: onError,
    );
  }

  @override
  void signUp({
    required String userName,
    required String email,
    required String password,
    Function(RegisterResponse)? onSuccess,
    Function(String? message, int? code)? onResponseError,
    Function(String? message)? onError,}) {
    Map<String, String> data = {
      "username": "$userName",
      "email": "$email",
      "password": "$password"
    };
    NetworkServices.sendRequest<RegisterResponse>(
      responseType: RegisterResponse(),
      endpoint: "auth/local/register",
      method: NetworkMethods.POST,
      requestName: "sign up",
      data: data,
      onSuccess: onSuccess,
      onResponseError: onResponseError,
      onError: onError,
    );
  }

  @override
  void updateImage() {
    // TODO: implement updateImage
  }

  @override
  void updateProfile() {
    // TODO: implement updateProfile
  }
}