import 'dart:convert';

import 'package:do_it_flutter/model/local/shared_preferences/shared_preferences_constants/user_preferences_constants.dart';
import 'package:do_it_flutter/model/local/shared_preferences/shared_preferences_services.dart';
import 'package:do_it_flutter/model/models/user_model.dart';

mixin UserPreferences {
  Future<bool> saveUser({required UserModel userModel}) {
    Map<String, dynamic> user = {
      UserPreferencesConstants.userId: userModel.id,
      UserPreferencesConstants.userJwt: userModel.jwt,
      UserPreferencesConstants.userName: userModel.email,
      UserPreferencesConstants.userEmail: userModel.email,
    };
    String data = jsonEncode(user);
    return SharedPreferencesServices.setString(
        UserPreferencesConstants.user, data);
  }

  Future<UserModel?> getUser() async {
    String? data = await SharedPreferencesServices.getString(
        UserPreferencesConstants.user);
    if (data != null) {
      Map<String, dynamic> user = jsonDecode(data);
      UserModel userModel = UserModel(
        id: user[UserPreferencesConstants.userId],
        jwt: user[UserPreferencesConstants.userJwt],
        email: user[UserPreferencesConstants.userEmail],
        name: user[UserPreferencesConstants.userName],
      );
      return userModel;
    } else {
      return null;
    }
  }

  Future<bool> logOut() {
    return SharedPreferencesServices.clear();
  }
}
