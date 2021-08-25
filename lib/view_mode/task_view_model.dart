import 'package:do_it_flutter/model/models/category_model.dart';
import 'package:do_it_flutter/model/models/task_model.dart';
import 'package:do_it_flutter/model/remote/api/api_services.dart';
import 'package:do_it_flutter/model/remote/api/responses/task_responses/get_tasks_response.dart';
import 'package:do_it_flutter/model/repositories/task_repository.dart';
import 'package:do_it_flutter/model/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class TaskViewModel extends ChangeNotifier {
  TaskRepository _repository = TaskRepository();
  List<TaskModel>? _tasks = [];

  Future<List<TaskModel>>? getTasks() async {
    await _repository.getTasks(onSuccess: (data) {
      UserRepository().getUser.then((user) {
        data.forEach((element) {
          if (element.userId == "${user?.id}") {
            TaskModel taskModel = TaskModel(
                title: element.title ?? "",
                done: element.done ?? false,
                description: element.description,
                categoryModel: CategoryModel(
                  name: element.category?.name ?? "",
                  color: int.parse(element.category?.color ?? "0"),
                ));

            _tasks?.add(taskModel);
          }
        });
      });
    });
    return _tasks!;
  }

  List<TaskModel>? get tasks => _tasks;
}
