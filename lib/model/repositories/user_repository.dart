import 'package:do_it_flutter/model/local/local_data_source.dart';
import 'package:do_it_flutter/model/models/user_model.dart';
import 'package:do_it_flutter/model/remote/user_remote_data_source.dart';

class UserRepository{
  UserRemoteDataSource _remoteDataSource = UserRemoteDataSource();
  UserLocalDataSource _localDataSource = UserLocalDataSource();

  Future<UserModel?> getUser(){
    return _localDataSource.getUser();
  }
}