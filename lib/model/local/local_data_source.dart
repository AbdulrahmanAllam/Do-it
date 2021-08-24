import 'package:do_it_flutter/model/local/shared_preferences/preferences/user_preferences.dart';
import 'package:do_it_flutter/model/models/user_model.dart';

class UserLocalDataSource{
  UserPreferences _preferences = UserPreferences();

  
  Future<UserModel?> getUser() {
    return _preferences.getUser();
  }


  Future<bool> logOut() {
    return _preferences.logOut();
  }


  Future<bool> saveUser({required UserModel userModel}) {
    return _preferences.saveUser(userModel: userModel);
  }
}

