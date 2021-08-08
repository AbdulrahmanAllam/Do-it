import 'package:do_it_flutter/model/objects/user_object.dart';

abstract class UserPreferences {
  void saveUser(UserObject user);
  Future<UserObject> getUser();
  void logOut();
}
