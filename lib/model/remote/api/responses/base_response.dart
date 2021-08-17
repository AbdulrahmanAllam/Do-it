abstract class BaseResponse {
  void fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
