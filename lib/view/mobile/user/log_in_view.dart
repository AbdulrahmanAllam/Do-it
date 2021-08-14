import 'package:do_it_flutter/utils/app_colors.dart';
import 'package:do_it_flutter/utils/app_height.dart';
import 'package:do_it_flutter/utils/widgets/custom_app_bar.dart';
import 'package:do_it_flutter/view/mobile/task/tasks_list_view.dart';
import 'package:do_it_flutter/view/mobile/user/user_widgets.dart';
import 'package:do_it_flutter/view/mobile/user/profile_view.dart';
import 'package:do_it_flutter/view/mobile/user/sign_up_view.dart';
import 'package:do_it_flutter/view_mode/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInView extends StatelessWidget {
  static const String route = "LoginView";

  @override
  Widget build(BuildContext context) {
    UserWidgets authWidgets = UserWidgets();
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
                    authWidgets.logo(),
                    AppHeight.h50,
                    authWidgets.emailField(),
                    AppHeight.h20,
                    authWidgets.passwordField(),
                    AppHeight.h50,
                    authWidgets.loginButton(onPressed: () {
                      //viewModel.login(context: context,route: ProfileView.route);
                      Navigator.pushReplacementNamed(
                          context, TasksListView.route);
                    }),
                    authWidgets.orDivider,
                    authWidgets.signUpButton(onPressed: () {
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
