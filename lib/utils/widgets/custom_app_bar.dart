import 'package:flutter/material.dart';

import '../app_colors.dart';

AppBar customAppBar({String? title, Widget? leading, bool? centerTitle, List<Widget>? actions}) {
  return AppBar(
    leading: leading,
    actions: actions,
    centerTitle: centerTitle,
    title: Text(
      "${title??''}",
      style: TextStyle(color: AppColors.black),
    ),
  );
}
