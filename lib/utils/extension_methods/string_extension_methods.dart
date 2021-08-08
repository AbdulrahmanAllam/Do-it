import 'package:do_it_flutter/utils/enums/enum_operations.dart';

extension StringExtensionMethods on String {
  T toEnum<T>(Iterable<T> values) {
    T e = values.firstWhere((element) =>
        EnumOperations.toLowerCase<T>(element) == this.toLowerCase());
    return e;
  }
}
