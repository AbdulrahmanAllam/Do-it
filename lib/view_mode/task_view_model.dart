
import 'package:do_it_flutter/model/remote/api/api_services.dart';
import 'package:do_it_flutter/model/remote/api/responses/task_responses/get_tasks_response.dart';
import 'package:do_it_flutter/model/repositories/task_repository.dart';
import 'package:flutter/material.dart';

class TaskViewModel extends ChangeNotifier{
  TaskRepository _repository = TaskRepository();
  List<GetTasksResponse>? tasks;

  Future<List<GetTasksResponse>>? getTasks() async{
    // await ApiServices.httpR();
    // await _repository.getTasks(
    //   onSuccess: (data){
    //     print("data => $data");
    //     tasks = data;
    //   }
    // );
    await _repository.getTasks(
      onSuccess: (data){
        print("tasks1 => $data");
        tasks = data;
        return tasks!;
      }
    );
    print("tasks2 => $tasks");
    return tasks!;
  }
}