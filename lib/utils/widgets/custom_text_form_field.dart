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
      validator:validator,
      onSaved: onSaved,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        // icon: Icon(Icons.email),
      ),
    );
  }
}
