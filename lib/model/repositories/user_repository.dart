import 'package:do_it_flutter/model/local/user_local_data_source.dart';
import 'package:do_it_flutter/model/models/user_model.dart';
import 'package:do_it_flutter/model/remote/api/responses/user_responses/login_response.dart';
import 'package:do_it_flutter/model/remote/api/responses/user_responses/sign_up_response.dart';
import 'package:do_it_flutter/model/remote/user_remote_data_source.dart';

class UserRepository{
  final UserRemoteDataSource _remoteDataSource = UserRemoteDataSource();
  final UserLocalDataSource _localDataSource = UserLocalDataSource();

  Future<UserModel?> get getUser => _localDataSource.getUser;

  Future<bool> saveUser({required UserModel user}){
    return _localDataSource.saveUser(userModel: user);
  }

  logIn({
    required String email,
    required String password,
    Function(LoginResponse)? onSuccess,
    Function(int?)? onError,
    void Function()? onConnectionError,
  }){
    _remoteDataSource.logIn(email: email, password: password, onSuccess: onSuccess, onConnectionError: onConnectionError,onError: onError);
  }

  signUp({
    required String userName,
    required String email,
    required String password,
    Function(SignUpResponse)? onSuccess,
    Function(int?)? onError,
    void Function()? onConnectionError,
  }){
    _remoteDataSource.signUp(userName: userName, email: email, password: password, onError: onError,onConnectionError: onConnectionError,onSuccess: onSuccess);
  }


}