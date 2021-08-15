import 'package:do_it_flutter/utils/app_colors.dart';
import 'package:do_it_flutter/utils/widgets/custom_item_widget.dart';
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

  Widget _uncheckedTask() {
    return _task(
      text: "Task",
      icon: Icons.circle,
      iconColor: Colors.amber,
      tapOnIcon: () {/* check task*/},
    );
  }

  Widget _checkedTask() {
    return _task(
      text: "Task",
      textStyle: TextStyle(
          color: AppColors.grey, decoration: TextDecoration.lineThrough),
      icon: Icons.check_circle_rounded,
      iconColor: Colors.green,
      tapOnIcon: () {/* un check task*/},
    );
  }

  Widget taskItem(int i) {
    if (i.isEven) {
      return _checkedTask();
    } else {
      return _uncheckedTask();
    }
  }
}
