import '../base_response.dart';

class RegisterResponse implements BaseResponse{
  String? jwt;
  RegisterResponseUser? user;

  RegisterResponse({this.jwt, this.user});

  void fromJson(Map<String, dynamic> json) {
    jwt = json['jwt'];
    user = json['user'] != null
        ? new RegisterResponseUser.fromJson(json['user'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jwt'] = this.jwt;
    data['user'] = this.user?.toJson();
    return data;
  }
}

class RegisterResponseUser {
  int? id;
  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  Null blocked;
  RegisterResponseRole? role;
  String? createdAt;
  String? updatedAt;
  Null image;

  RegisterResponseUser(
      {this.id,
      this.username,
      this.email,
      this.provider,
      this.confirmed,
      this.blocked,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.image});

  RegisterResponseUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    provider = json['provider'];
    confirmed = json['confirmed'];
    blocked = json['blocked'];
    role = json['role'] != null
        ? new RegisterResponseRole.fromJson(json['role'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['provider'] = this.provider;
    data['confirmed'] = this.confirmed;
    data['blocked'] = this.blocked;
    data['role'] = this.role?.toJson();
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    return data;
  }
}

class RegisterResponseRole {
  int? id;
  String? name;
  String? description;
  String? type;

  RegisterResponseRole({this.id, this.name, this.description, this.type});

  RegisterResponseRole.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['type'] = this.type;
    return data;
  }
}
