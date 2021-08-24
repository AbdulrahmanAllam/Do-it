import 'package:do_it_flutter/utils/enums/enum_operations.dart';
import 'package:do_it_flutter/utils/enums/api_methods.dart';

extension ApiMethodsExtensionMethods on ApiMethods {
  String toText() {
    return EnumOperations.toText<ApiMethods>(this);
  }

  String toLowerCase() {
    return EnumOperations.toLowerCase<ApiMethods>(this);
  }

  String toUpperCase() {
    return EnumOperations.toUpperCase<ApiMethods>(this);
  }
}
