import 'package:do_it_flutter/utils/app_colors.dart';
import 'package:do_it_flutter/view/mobile/layouts/drawer_layout.dart';
import 'package:do_it_flutter/view/mobile/task/add_task_view.dart';
import 'package:do_it_flutter/view/mobile/task/task_widgets.dart';
import 'package:do_it_flutter/view/mobile/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TasksListView extends StatelessWidget {
  static const String route = "TasksView";

  @override
  Widget build(BuildContext context) {
    TaskWidgets taskWidgets = TaskWidgets();
    return Scaffold(
      drawer: DrawerLayout(),
      appBar: customAppBar(
          title: "All Tasks",
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: LinearPercentIndicator(
                    lineHeight: 20,
                    backgroundColor: AppColors.grey,
                    progressColor: AppColors.black,
                    percent: 60 / 100,
                    center: Text(
                      "60%",
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text("6 / 10")
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) => taskWidgets.taskItem(index),
            ),
          ),
        ],
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
