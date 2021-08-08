import 'package:flutter/material.dart';

import '../app_colors.dart';

AppBar customAppBar({String? title, Widget? leading}) {
  return AppBar(
    backgroundColor: AppColors.white,
    elevation: 0.0,
    centerTitle: true,
    leading: leading,
    title: Text(
      "$title",
      style: TextStyle(color: AppColors.black),
    ),
  );
}
