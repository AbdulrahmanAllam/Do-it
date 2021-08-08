import 'package:do_it_flutter/utils/app_colors.dart';
import 'package:do_it_flutter/utils/widgets/custom_app_bar.dart';
import 'package:do_it_flutter/view/mobile/user/auth_widgets.dart';
import 'package:do_it_flutter/view/mobile/user/sign_up_view.dart';
import 'package:do_it_flutter/view_mode/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInView extends StatelessWidget {
  static const String route = "LoginView";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserViewModel>(
      create: (context) => UserViewModel(),
      child: Scaffold(
        appBar: customAppBar(title: "Log In"),
        body:SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Consumer<UserViewModel>(
              builder: (context, viewModel, child){
                AuthWidgets authWidgets = AuthWidgets(viewModel: viewModel);
                return Form(
                  key: viewModel.formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child: SizedBox(height: double.infinity,)),
                        authWidgets.logo(),
                        Expanded(child: SizedBox(height: double.infinity,)),
                        authWidgets.emailField(),
                        Expanded(child: SizedBox(height: double.infinity,)),
                        authWidgets.passwordField(),
                        Expanded(child: SizedBox(height: double.infinity,)),
                        authWidgets.loginButton(onPressed: (){
                          viewModel.login();
                        }),
                        authWidgets.orDivider(),
                        authWidgets.signUpButton(onPressed: (){
                          Navigator.pushNamed(context, SignUpView.route);
                        }),
                      ],
                    ),
                  ),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
