import 'package:do_it_flutter/utils/app_colors.dart';
import 'package:do_it_flutter/utils/app_images.dart';
import 'package:do_it_flutter/view/mobile/widgets/custom_text_form_field.dart';
import 'package:do_it_flutter/view/mobile/widgets/cutom_material_button.dart';
import 'package:do_it_flutter/view_mode/user_view_model.dart';
import 'package:flutter/material.dart';

class UserWidgets {
  UserViewModel viewModel = UserViewModel();

  Widget logo() {
    return Image.asset(
      AppImages.getPngImage("logo"),
      height: 100,
    );
  }

  Widget emailField({String? Function(String?)? validator, void Function(String?)? onSaved}) {
    return CustomTextFormField(
      hintText: "email",
      icon: Icons.email,
      validator: validator,
      onSaved: onSaved,
    );
  }

  Widget passwordField({String? Function(String?)? validator, void Function(String?)? onSaved}) {
    return CustomTextFormField(
      hintText: "password",
      icon: Icons.lock,
      validator: validator,
      onSaved: onSaved,
    );
  }

  Widget loginButton({required void Function()? onPressed}) {
    return CustomMaterialButton(
      onPressed: onPressed,
      text: "Log In",
    );
  }

  Widget get orDivider {
    return Row(
      children: [
        _divider(),
        SizedBox(
          width: 10,
        ),
        Text(
          "or",
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(
          width: 10,
        ),
        _divider(),
      ],
    );
  }

  Widget signUpButton({required void Function()? onPressed}) {
    return CustomMaterialButton(
      onPressed: onPressed,
      text: "Sign Up",
    );
  }

  Widget _divider() {
    return Expanded(
      child: Divider(
        height: 50,
        thickness: 1,
        color: AppColors.black,
      ),
    );
  }
}
