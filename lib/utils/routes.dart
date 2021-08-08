import 'package:do_it_flutter/view/mobile/user/log_in_view.dart';
import 'package:do_it_flutter/view/mobile/user/sign_up_view.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> routes = {
  LogInView.route: (context) => LogInView(),
  SignUpView.route: (context) => SignUpView(),
};
