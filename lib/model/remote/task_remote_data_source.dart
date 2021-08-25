import 'package:do_it_flutter/model/remote/api/apis/task_apis.dart';

import 'api/responses/task_responses/get_tasks_response.dart';

class TaskRemoteDataSource {
  final TaskApis _apis = TaskApis();
  
  getTasks({
    required String jwt,
    Function(List<GetTasksResponse>)? onSuccess,
    Function(int)? onError,
    Function()? onConnectionError,
  }) {
    _apis.getTasks(
        jwt: jwt,
        onSuccess: onSuccess,
        onConnectionError: onConnectionError,
        onError: onError);
  }
}
