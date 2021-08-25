import 'package:do_it_flutter/model/models/task_model.dart';
import 'package:do_it_flutter/model/remote/api/responses/task_responses/get_tasks_response.dart';
import 'package:do_it_flutter/utils/app_colors.dart';
import 'package:do_it_flutter/view/mobile/layouts/drawer_layout.dart';
import 'package:do_it_flutter/view/mobile/task/add_task_view.dart';
import 'package:do_it_flutter/view/mobile/task/task_widgets.dart';
import 'package:do_it_flutter/view/mobile/widgets/custom_app_bar.dart';
import 'package:do_it_flutter/view/mobile/widgets/custom_floating_action_button.dart';
import 'package:do_it_flutter/view_mode/task_view_model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class TasksListView extends StatelessWidget {
  static const String route = "TasksView";

  @override
  Widget build(BuildContext context) {
    TaskWidgets taskWidgets = TaskWidgets();
    return ChangeNotifierProvider<TaskViewModel>(
      create: (context) => TaskViewModel(),
      child: Scaffold(
        drawer: DrawerLayout(),
        appBar: customAppBar(
            title: "All Tasks",
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))]),
        body: Column(
          children: [
            ProgressBar(),
            Consumer<TaskViewModel>(
              builder: (context, viewModel, child){
                return FutureBuilder<List<TaskModel>>(
                  future: viewModel.getTasks(),
                  builder:(context, AsyncSnapshot<List<TaskModel>> snapshot){
                    if(snapshot.hasData && snapshot.data != null){
                      print("color : ${Color(0xFFFF3D00).value}");
                      return Expanded(
                        child: ListView.builder(
                          itemCount: viewModel.tasks?.length,
                          itemBuilder: (context, index) => taskWidgets.taskItem(snapshot.data![index]),
                          // itemBuilder: (context, index) => Text("${snapshot.data?[index].title}"),
                        ),
                      );
                    }
                    return Text("no");
                }
                );
              },
            ),
          ],
        ),
        floatingActionButton: CustomFloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, AddTaskView.route),
        ),
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}