import 'package:do_it_flutter/utils/enums/enum_operations.dart';
import 'package:do_it_flutter/utils/enums/network_methods.dart';

extension NetworkMethodsExtensionMethods on NetworkMethods {
  String toText() {
    return EnumOperations.toText<NetworkMethods>(this);
  }

  String toLowerCase() {
    return EnumOperations.toLowerCase<NetworkMethods>(this);
  }

  String toUpperCase() {
    return EnumOperations.toUpperCase<NetworkMethods>(this);
  }
}
