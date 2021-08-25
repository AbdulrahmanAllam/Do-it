import 'category_model.dart';

class TaskModel {
  late String _title;
  String? _description;
  late bool _done;
  late CategoryModel _category;

  TaskModel({required String title, required bool done, required CategoryModel categoryModel, String? description})
      :_title = title, _description = description, _done = done, _category = categoryModel ;

  String get title => _title;
  set title(String value) {
    _title = value;
  }

  String get description => _description??"";
  set description(String value) {
    _description = value;
  }

  bool get done => _done;
  set done(bool value) => _done = value;

  CategoryModel get category => _category;
  set category(CategoryModel value) {
    _category = value;
  }
}
