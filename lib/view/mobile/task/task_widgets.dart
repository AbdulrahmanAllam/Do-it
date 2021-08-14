import 'package:do_it_flutter/utils/app_colors.dart';
import 'package:do_it_flutter/utils/app_width.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskWidgets {
  Widget _task(
      {required IconData icon,
      required Color iconColor,
      required String task,
      required void Function()? onPressed,
      TextStyle? style}) {
    return Row(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          iconSize: 17,
          color: iconColor,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "$task",
          style: style,
        ),
        AppWidth.expanded,
        IconButton(
          onPressed: () {
            //TODo:remove task
          },
          icon: Icon(Icons.close),
          iconSize: 17,
        ),
      ],
    );
  }

  Widget _uncheckedTask() {
    return _task(
      icon: Icons.circle,
      iconColor: Colors.amber,
      task: "Task",
      onPressed: () {
        //TODO: change done to true
      },
    );
  }

  Widget _checkedTask() {
    return _task(
        icon: Icons.check_circle_rounded,
        iconColor: Colors.green,
        task: "Task",
        onPressed: () {
          //TODO: change done to false
        },
        style: TextStyle(
            color: AppColors.grey, decoration: TextDecoration.lineThrough));
  }

  Widget taskItem(int i) {
    if (i.isEven) {
      return _checkedTask();
    } else {
      return _uncheckedTask();
    }
  }
}
