import 'package:do_it_flutter/model/remote/api/responses/base_response.dart';

class LoginResponse implements BaseResponse{
  String? jwt;
  LoginResponseUser? user;

  LoginResponse({this.jwt, this.user});

  fromJson(Map<String, dynamic> json) {
    jwt = json['jwt'];
    user = json['user'] != null ? new LoginResponseUser.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jwt'] = this.jwt;
      data['user'] = this.user?.toJson();
    
    return data;
  }
}

class LoginResponseUser {
  int? id;
  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  Null blocked;
  LoginResponseRole? role;
  String? createdAt;
  String? updatedAt;

  LoginResponseUser(
      {this.id,
      this.username,
      this.email,
      this.provider,
      this.confirmed,
      this.blocked,
      this.role,
      this.createdAt,
      this.updatedAt});

  LoginResponseUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    provider = json['provider'];
    confirmed = json['confirmed'];
    blocked = json['blocked'];
    role = json['role'] != null ? new LoginResponseRole.fromJson(json['role']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    return data;
  }
}

class LoginResponseRole {
  int? id;
  String? name;
  String? description;
  String? type;

  LoginResponseRole({this.id, this.name, this.description, this.type});

  LoginResponseRole.fromJson(Map<String, dynamic> json) {
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
