import 'package:do_it_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {

  void Function()? onPressed;

  CustomFloatingActionButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(
        Icons.add,
        color: AppColors.white,
      ),
    );
  }
}
