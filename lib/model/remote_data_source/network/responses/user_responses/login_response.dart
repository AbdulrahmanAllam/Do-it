import '../base_response.dart';

class LoginResponse implements BaseResponse {
  String? jwt;
  LoginResponseUser? user;

  LoginResponse({this.jwt, this.user});

  void fromJson(Map<String, dynamic> json) {
    jwt = json['jwt'];
    user = json['user'] != null
        ? new LoginResponseUser.fromJson(json['user'])
        : null;
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
  LoginResponseImage? image;

  LoginResponseUser(
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

  LoginResponseUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    provider = json['provider'];
    confirmed = json['confirmed'];
    blocked = json['blocked'];
    role = json['role'] != null
        ? new LoginResponseRole.fromJson(json['role'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'] != null
        ? new LoginResponseImage.fromJson(json['image'])
        : null;
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
    data['image'] = this.image?.toJson();
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

class LoginResponseImage {
  int? id;
  String? name;
  Null alternativeText;
  Null caption;
  int? width;
  int? height;
  LoginResponseFormats? formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  Null previewUrl;
  String? provider;
  Null providerMetadata;
  String? createdAt;
  String? updatedAt;

  LoginResponseImage(
      {this.id,
      this.name,
      this.alternativeText,
      this.caption,
      this.width,
      this.height,
      this.formats,
      this.hash,
      this.ext,
      this.mime,
      this.size,
      this.url,
      this.previewUrl,
      this.provider,
      this.providerMetadata,
      this.createdAt,
      this.updatedAt});

  LoginResponseImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    width = json['width'];
    height = json['height'];
    formats = json['formats'] != null
        ? new LoginResponseFormats.fromJson(json['formats'])
        : null;
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size'];
    url = json['url'];
    previewUrl = json['previewUrl'];
    provider = json['provider'];
    providerMetadata = json['provider_metadata'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['alternativeText'] = this.alternativeText;
    data['caption'] = this.caption;
    data['width'] = this.width;
    data['height'] = this.height;

    data['formats'] = this.formats?.toJson();

    data['hash'] = this.hash;
    data['ext'] = this.ext;
    data['mime'] = this.mime;
    data['size'] = this.size;
    data['url'] = this.url;
    data['previewUrl'] = this.previewUrl;
    data['provider'] = this.provider;
    data['provider_metadata'] = this.providerMetadata;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class LoginResponseFormats {
  LoginResponseThumbnail? thumbnail;
  LoginResponseThumbnail? large;
  LoginResponseThumbnail? medium;
  LoginResponseThumbnail? small;

  LoginResponseFormats({this.thumbnail, this.large, this.medium, this.small});

  LoginResponseFormats.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'] != null
        ? new LoginResponseThumbnail.fromJson(json['thumbnail'])
        : null;
    large = json['large'] != null
        ? new LoginResponseThumbnail.fromJson(json['large'])
        : null;
    medium = json['medium'] != null
        ? new LoginResponseThumbnail.fromJson(json['medium'])
        : null;
    small = json['small'] != null
        ? new LoginResponseThumbnail.fromJson(json['small'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['thumbnail'] = this.thumbnail?.toJson();

    data['large'] = this.large?.toJson();

    data['medium'] = this.medium?.toJson();

    data['small'] = this.small?.toJson();

    return data;
  }
}

class LoginResponseThumbnail {
  String? name;
  String? hash;
  String? ext;
  String? mime;
  int? width;
  int? height;
  double? size;
  Null path;
  String? url;

  LoginResponseThumbnail(
      {this.name,
      this.hash,
      this.ext,
      this.mime,
      this.width,
      this.height,
      this.size,
      this.path,
      this.url});

  LoginResponseThumbnail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    width = json['width'];
    height = json['height'];
    size = json['size'];
    path = json['path'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['hash'] = this.hash;
    data['ext'] = this.ext;
    data['mime'] = this.mime;
    data['width'] = this.width;
    data['height'] = this.height;
    data['size'] = this.size;
    data['path'] = this.path;
    data['url'] = this.url;
    return data;
  }
}
