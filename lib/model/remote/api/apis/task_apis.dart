import 'package:dio/dio.dart';
import 'package:do_it_flutter/model/remote/api/api_services.dart';
import 'package:do_it_flutter/model/remote/api/http_services.dart';
import 'package:do_it_flutter/model/remote/api/responses/task_responses/get_tasks_response.dart';
import 'package:do_it_flutter/utils/enums/api_methods.dart';

class TaskApis {
  HttpServices _httpServices = HttpServices();
  void addTask() {}
  void doneTask() {}
  void updateTask() {}
  void deleteTask() {}
  Future<void> getTasks({
    required String jwt,
    Function(List<GetTasksResponse>)? onSuccess,
    Function(int)? onError,
    Function()? onConnectionError,
  }) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $jwt",
    };
    await _httpServices.get(
      endpoint: "tasks",
      requestName: "get tasks",
      headers: headers,
      onSuccess: (response){
        List<GetTasksResponse> data = getTasksResponseFromJson(response);
        if(onSuccess != null)
          onSuccess(data);
      },
      onError: onError,
      onConnectionError: onConnectionError,
    );
  }
}
