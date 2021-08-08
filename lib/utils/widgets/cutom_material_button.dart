import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  void Function()? onPressed;
  String? text;

  CustomMaterialButton({required this.onPressed, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40  ,
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: Colors.amber,
        child: Text("$text"),
      ),
    );
  }
}
