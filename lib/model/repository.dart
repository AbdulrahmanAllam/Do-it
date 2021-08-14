import 'package:do_it_flutter/model/local_data_source/local_data_source.dart';
import 'package:do_it_flutter/model/remote_data_source/network/responses/user_responses/login_response.dart';
import 'package:do_it_flutter/model/remote_data_source/network/responses/user_responses/register_response.dart';
import 'package:do_it_flutter/model/remote_data_source/remote_data_source.dart';
import 'objects/user_object.dart';

class Repository {
  RemoteDataSource _remoteDataSource = RemoteDataSource();
  LocalDataSource _localDataSource = LocalDataSource();

  void login({
    required String email,
    required String password,
    Function(LoginResponse response)? onSuccess,
    Function(String? message, int? code)? onResponseError,
    Function(String? message)? onError,
  }) {
    _remoteDataSource.login(
        email: email,
        password: password,
        onSuccess: onSuccess,
        onError: onError,
        onResponseError: onResponseError);
  }

  void signUp({
    required String userName,
    required String email,
    required String password,
    Function(RegisterResponse)? onSuccess,
    Function(String? message, int? code)? onResponseError,
    Function(String? message)? onError,
  }) {
    _remoteDataSource.signUp(
        userName: userName,
        email: email,
        password: password,
        onSuccess: onSuccess,
        onResponseError: onResponseError,
        onError: onError);
  }

  Future<bool> saveUser(UserObject user) async {
    return await _localDataSource.saveUser(user);
  }

  Future<UserObject> getUser() async {
    return _localDataSource.getUser();
  }

  void logOut() {
    _localDataSource.logOut();
  }
}
