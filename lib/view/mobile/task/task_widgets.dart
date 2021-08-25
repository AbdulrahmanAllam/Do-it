import 'dart:math';

import 'package:do_it_flutter/model/models/task_model.dart';
import 'package:do_it_flutter/utils/app_colors.dart';
import 'package:do_it_flutter/view/mobile/widgets/custom_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskWidgets {
  Widget _task(
      {IconData? icon,
      Color? iconColor,
      String? text,
      TextStyle? textStyle,
      void Function()? tapOnIcon}) {
    return CustomItemWidget(
      text: text,
      textStyle: textStyle,
      icon: icon,
      iconColor: iconColor,
      tapOnIcon: tapOnIcon,
      onTap: () {/* navigat to update task screen*/},
      deleteItem: () {/* delete task*/},
    );
  }

  Widget _uncheckedTask(TaskModel task) {
    return _task(
      text: "${task.title}",
      iconColor: Color(task.category.color),
      tapOnIcon: () {/* check task*/},
    );
  }

  Widget _checkedTask(TaskModel task) {
    return _task(
      text: "${task.title}",
      textStyle: TextStyle(
          color: AppColors.grey, decoration: TextDecoration.lineThrough),
      icon: Icons.check_circle_rounded,
      iconColor: Color(task.category.color),
      tapOnIcon: () {/* un check task*/},
    );
  }

  Widget taskItem(TaskModel task) {
    if (task.done) {
      return _checkedTask(task);
    } else {
      return _uncheckedTask(task);
    }
  }
}
