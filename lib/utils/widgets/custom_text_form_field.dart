import 'package:do_it_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String? Function(String?)? validator;
  void Function(String?)? onSaved;
  IconData? icon;
  String? hintText;


  CustomTextFormField({this.validator, this.onSaved, this.icon, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.black,
      validator:validator,
      onSaved: onSaved,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),

        hintText: hintText,
        prefixIcon: Icon(icon,color: AppColors.black,),
        // icon: Icon(Icons.email),
      ),
    );
  }
}
