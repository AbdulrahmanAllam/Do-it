import 'package:do_it_flutter/utils/widgets/custom_text_form_field.dart';
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
        appBar: AppBar(),
        body:Consumer<UserViewModel>(
          builder: (context, viewModel, child){
            AuthWidgets authWidgets = AuthWidgets(viewModel: viewModel);
            return Form(
              key: viewModel.formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    authWidgets.logo(),
                    authWidgets.emailField(),
                    authWidgets.passwordField(),
                    SizedBox(height: 10,),
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
    );
  }
}
