import 'dart:convert';
import 'package:do_it_flutter/model/local_data_source/shared_preferences/preferences/user_preferences.dart';
import 'package:do_it_flutter/model/local_data_source/shared_preferences/shared_preferences_constants/user_preferences_constants.dart';
import 'package:do_it_flutter/model/objects/user_object.dart';
import 'package:do_it_flutter/utils/log.dart';
import '../shared_preferences_services.dart';

class Preferences implements UserPreferences{

  @override
  void saveUser(UserObject user) {
    Map<String, dynamic> map = {
      UserPreferencesConstants.userId: user.id,
      UserPreferencesConstants.userToken: user.token,
    };
    String data = jsonEncode(map);
    SharedPreferencesServices.setString(UserPreferencesConstants.user, data);
    Log.information("user saved");
  }

  @override
  Future<UserObject> getUser() async {
    Map<String, dynamic> user = jsonDecode(
        await SharedPreferencesServices.getString(
            UserPreferencesConstants.user));
    return UserObject(
        id: user[UserPreferencesConstants.userId],
        token: user[UserPreferencesConstants.userToken]);
  }

  @override
  void logOut() {
    SharedPreferencesServices.clear();
  }
}