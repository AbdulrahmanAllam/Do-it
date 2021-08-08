import 'package:do_it_flutter/model/local_data_source/shared_preferences/preferences/preferences.dart';
import 'package:do_it_flutter/model/objects/user_object.dart';
import 'package:do_it_flutter/utils/log.dart';

class LocalDataSource{
  Preferences _preferences = Preferences();

  void saveUser(UserObject user){
    _preferences.saveUser(user);
  }

  Future<UserObject> getUser() async{
    return _preferences.getUser();
  }

  void logOut(){
    _preferences.logOut();
  }

}