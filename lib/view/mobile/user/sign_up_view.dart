import 'package:do_it_flutter/utils/app_colors.dart';
import 'package:do_it_flutter/utils/app_height.dart';
import 'package:do_it_flutter/utils/widgets/custom_app_bar.dart';
import 'package:do_it_flutter/utils/widgets/custom_text_form_field.dart';
import 'package:do_it_flutter/view/mobile/user/profile_view.dart';
import 'package:do_it_flutter/view_mode/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_widgets.dart';

class SignUpView extends StatelessWidget {
  static const String route = "SignUpView";

  @override
  Widget build(BuildContext context) {
    UserWidgets authWidgets = UserWidgets();
    return ChangeNotifierProvider<UserViewModel>(
      create: (context) => UserViewModel(),
      child: Scaffold(
        appBar: customAppBar(
          title: "Sign Up",
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_outlined,
              color: AppColors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Consumer<UserViewModel>(builder: (context, viewModel, child) {
            return Form(
              key: viewModel.formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    AppHeight.h50,
                    authWidgets.logo(),
                    AppHeight.h50,
                    CustomTextFormField(
                      hintText: "user name",
                      icon: Icons.person,
                      validator: (value) => viewModel.validateUserName(value),
                      onSaved: (value) => viewModel.userName = value,
                    ),
                    AppHeight.h20,
                    authWidgets.emailField(),
                    AppHeight.h20,
                    authWidgets.passwordField(),
                    AppHeight.h50,
                    authWidgets.signUpButton(onPressed: () {
                      viewModel.signUp(
                          context: context, route: ProfileView.route);
                    }),
                    authWidgets.orDivider,
                    authWidgets.loginButton(onPressed: () {
                      Navigator.pop(context);
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
