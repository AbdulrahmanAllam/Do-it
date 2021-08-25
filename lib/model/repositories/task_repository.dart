import 'package:do_it_flutter/model/remote/api/responses/task_responses/get_tasks_response.dart';
import 'package:do_it_flutter/model/remote/task_remote_data_source.dart';
import 'package:do_it_flutter/model/repositories/user_repository.dart';

class TaskRepository{
  final TaskRemoteDataSource _remoteDataSource = TaskRemoteDataSource();

  getTasks({Function(List<GetTasksResponse>)? onSuccess, Function(int)? onError, Function()? onConnectionError}){
    UserRepository().getUser.then((user) {
      if(user != null){
        _remoteDataSource.getTasks(jwt: user.jwt, onSuccess: onSuccess, onError: onError, onConnectionError: onConnectionError);
      }
    });
  }

}