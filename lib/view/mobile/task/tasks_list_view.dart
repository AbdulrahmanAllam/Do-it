import 'package:do_it_flutter/utils/app_colors.dart';
import 'package:do_it_flutter/utils/widgets/custom_app_bar.dart';
import 'package:do_it_flutter/view/mobile/layers/drawer_layer.dart';
import 'package:do_it_flutter/view/mobile/task/add_task_view.dart';
import 'package:do_it_flutter/view/mobile/task/task_widgets.dart';
import 'package:flutter/material.dart';

class TasksListView extends StatelessWidget {
  static const String route = "TasksView";

  @override
  Widget build(BuildContext context) {
    TaskWidgets taskWidgets = TaskWidgets();
    return Scaffold(
      drawer: DrawerLayer(),
      appBar: customAppBar(
          title: "All Tasks",
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.delete))]),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => taskWidgets.taskItem(index),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddTaskView.route);
        },
        child: Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}
