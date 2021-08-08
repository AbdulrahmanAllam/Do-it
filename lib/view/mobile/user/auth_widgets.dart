import 'package:do_it_flutter/utils/app_colors.dart';
import 'package:do_it_flutter/utils/app_images.dart';
import 'package:do_it_flutter/utils/widgets/custom_text_form_field.dart';
import 'package:do_it_flutter/utils/widgets/cutom_material_button.dart';
import 'package:do_it_flutter/view_mode/user_view_model.dart';
import 'package:flutter/material.dart';

class AuthWidgets {
  late UserViewModel viewModel;
  AuthWidgets({required this.viewModel});

  Widget logo(){
    return Image.asset(AppImages.getPngImage("logo"),height: 100,);
  }

  Widget emailField() {
    return CustomTextFormField(
      hintText: "email",
      icon: Icons.email,
      validator: (value) => viewModel.validateEmail(value),
      onSaved: (value) => viewModel.email = value,
    );
  }

  Widget passwordField() {
    return CustomTextFormField(
      hintText: "password",
      icon: Icons.lock,
      validator: (value) => viewModel.validatePassword(value),
      onSaved: (value) => viewModel.password = value,
    );
  }

  Widget loginButton({required void Function()? onPressed}) {
    return CustomMaterialButton(onPressed: onPressed ,text: "Log In",);
  }

  Widget orDivider(){
    return Row(
      children: [
        Expanded(
          child: Divider(
            height: double.infinity,
            thickness: 1 ,
            color: AppColors.black,
          ),
        ),
        SizedBox(width: 10,),
        Text("or",style: TextStyle(fontSize: 15),),
        SizedBox(width: 10,),
        Expanded(
          child: Divider(
            height: double.infinity,
            thickness: 1 ,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  Widget signUpButton({required void Function()? onPressed}) {
    return CustomMaterialButton(onPressed: onPressed, text: "Sign Up",);
  }
}
