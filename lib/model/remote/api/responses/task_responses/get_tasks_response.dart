import 'dart:convert';

List<GetTasksResponse> getTasksResponseFromJson(String str) => List<GetTasksResponse>.from(json.decode(str).map((x) => GetTasksResponse.fromJson(x)));

String getTasksResponseToJson(List<GetTasksResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetTasksResponse {
  GetTasksResponse({
    this.id,
    this.title,
    this.done,
    this.description,
    this.userId,
    this.category,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  bool? done;
  String? description;
  String? userId;
  GetTasksResponseCategory? category;
  DateTime? publishedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory GetTasksResponse.fromJson(Map<String, dynamic> json) => GetTasksResponse(
    id: json["id"],
    title: json["title"],
    done: json["done"],
    description: json["description"] == null ? null : json["description"],
    userId: json["user_id"],
    category: GetTasksResponseCategory.fromJson(json["category"]),
    publishedAt: DateTime.parse(json["published_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "done": done,
    "description": description == null ? null : description,
    "user_id": userId,
    "category": category?.toJson(),
    "published_at": publishedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class GetTasksResponseCategory {
  GetTasksResponseCategory({
    this.id,
    this.name,
    this.color,
    this.userId,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? color;
  String? userId;
  DateTime? publishedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory GetTasksResponseCategory.fromJson(Map<String, dynamic> json) => GetTasksResponseCategory(
    id: json["id"],
    name: json["name"],
    color: json["color"],
    userId: json["user_id"],
    publishedAt: DateTime.parse(json["published_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "color": color,
    "user_id": userId,
    "published_at": publishedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
