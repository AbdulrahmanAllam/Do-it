import 'package:do_it_flutter/model/remote/api/apis/task_apis.dart';

import 'api/responses/task_responses/get_tasks_response.dart';

class TaskRemoteDataSource {
  final TaskApis _apis = TaskApis();
  
  Future<void> getTasks({
    required String jwt,
    Function(List<GetTasksResponse>)? onSuccess,
    Function(int)? onError,
    Function()? onConnectionError,
  }) async {
    await _apis.getTasks(
        jwt: jwt,
        onSuccess: onSuccess,
        onConnectionError: onConnectionError,
        onError: onError);
  }
}
