import 'package:do_it_flutter/utils/app_height.dart';
import 'package:do_it_flutter/view/mobile/task/tasks_list_view.dart';
import 'package:do_it_flutter/view/mobile/user/sign_up_view.dart';
import 'package:do_it_flutter/view/mobile/user/user_widgets.dart';
import 'package:do_it_flutter/view/mobile/widgets/custom_app_bar.dart';
import 'package:do_it_flutter/view_mode/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInView extends StatelessWidget {
  static const String route = "LoginView";

  @override
  Widget build(BuildContext context) {
    UserWidgets userWidgets = UserWidgets();
    return ChangeNotifierProvider<UserViewModel>(
      create: (context) => UserViewModel(),
      child: Scaffold(
        appBar: customAppBar(title: "Log In", centerTitle: true),
        body: SingleChildScrollView(
          child: Consumer<UserViewModel>(builder: (context, viewModel, child) {
            return Form(
              key: viewModel.formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AppHeight.h50,
                    userWidgets.logo(),
                    AppHeight.h50,
                    userWidgets.emailField(),
                    AppHeight.h20,
                    userWidgets.passwordField(),
                    AppHeight.h50,
                    userWidgets.loginButton(onPressed: () {
                      //viewModel.login(context: context,route: ProfileView.route);
                      Navigator.pushReplacementNamed(
                          context, TasksListView.route);
                    }),
                    userWidgets.orDivider,
                    userWidgets.signUpButton(onPressed: () {
                      Navigator.pushNamed(context, SignUpView.route);
                    }),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
