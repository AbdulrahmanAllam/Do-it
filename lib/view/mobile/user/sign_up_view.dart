import 'package:do_it_flutter/utils/widgets/custom_text_form_field.dart';
import 'package:do_it_flutter/view_mode/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_widgets.dart';

class SignUpView extends StatelessWidget {
  static const String route = "SignUpView";

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
                    children: [
                      CustomTextFormField(
                        hintText: "user name",
                        icon: Icons.person,
                        validator: (value) => viewModel.validateUserName(value),
                        onSaved: (value) => viewModel.userName = value,
                      ),
                      //email text filed
                      SizedBox(height: 10,),
                      authWidgets.emailField(),
                      SizedBox(height: 10,),
                      authWidgets.passwordField(),
                      SizedBox(height: 10,),
                      authWidgets.signUpButton(onPressed: (){
                        viewModel.signUp();
                      }),
                      authWidgets.orDivider(),
                      authWidgets.loginButton(onPressed: (){
                        Navigator.pop(context);
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
