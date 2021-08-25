import 'dart:async';

import 'package:do_it_flutter/model/repositories/user_repository.dart';
import 'package:do_it_flutter/utils/app_images.dart';
import 'package:do_it_flutter/view/mobile/task/tasks_list_view.dart';
import 'package:do_it_flutter/view/mobile/user/log_in_view.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String route = "SplashScreen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late UserRepository _userRepository;

  @override
  void initState() {
    _userRepository = UserRepository();
    Timer(
      Duration(seconds: 3),
      _goTo,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 140.0),
        child: Center(
          child: Image.asset(AppImages.getPngImage("logo")),
        ),
      ),
    );
  }

  _goTo(){
    _userRepository.getUser.then((value) {
      if(value == null){
       Navigator.pushReplacementNamed(context, LogInView.route);
      }
      else{
       Navigator.pushReplacementNamed(context, TasksListView.route);
      }
    });
  }
}
