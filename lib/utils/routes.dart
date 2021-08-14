import 'package:do_it_flutter/view/mobile/category/categoryies_list_view.dart';
import 'package:do_it_flutter/view/mobile/task/add_task_view.dart';
import 'package:do_it_flutter/view/mobile/task/tasks_list_view.dart';
import 'package:do_it_flutter/view/mobile/user/log_in_view.dart';
import 'package:do_it_flutter/view/mobile/user/profile_view.dart';
import 'package:do_it_flutter/view/mobile/user/sign_up_view.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> routes = {
  LogInView.route: (context) => LogInView(),
  SignUpView.route: (context) => SignUpView(),
  ProfileView.route: (context) => ProfileView(),
  TasksListView.route: (context) => TasksListView(),
  AddTaskView.route: (context) => AddTaskView(),
  CategoriesListView.route: (context) => CategoriesListView(),
};
