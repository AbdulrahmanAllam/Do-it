abstract class EnumOperations {
  static String toText<T>(T value) {
    String text = value.toString().split(".").last;
    return text;
  }

  static String toLowerCase<T>(T value) {
    String text = value.toString().split(".").last.toLowerCase();
    return text;
  }

  static String toUpperCase<T>(T value) {
    String text = value.toString().split(".").last.toUpperCase();
    return text;
  }
}
