
import 'package:do_it_flutter/model/models/task_model.dart';

class CategoryModel {
  late String _name;
  late int _color;
  late List<TaskModel>? _tasks;

  CategoryModel({required String name, required int color, List<TaskModel>? tasks})
      :_name = name, _color = color, _tasks = tasks;

  String get name => _name;
  set name(String value) {
    _name = value;
  }

  int get color => _color;
  set color(int value) {
    _color = value;
  }

  List<TaskModel>? get tasks => _tasks;
  set tasks(List<TaskModel>? value) {
    _tasks = value;
  }
}
