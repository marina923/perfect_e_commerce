class ClientModel {
  ClientModel({
    this.success,
    this.data,
    this.message,
  });

  ClientModel.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
  bool? success;
  Data? data;
  String? message;
}

class Data {
  Data({
    this.user,
    this.token,
  });

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  User? user;
  String? token;
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.image,
    this.online,
    this.nationalId,
    this.nationalIdImage,
    this.provider,
    this.providerId,
    this.local,
    this.role,
    this.emailVerifiedAt,
    this.phoneVerifiedAt,
    this.approvedByAdmin,
    this.approvedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
    this.nationalIdUrl,
    this.roleName,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    image = json['image'];
    online = json['online'];
    nationalId = json['national_id'];
    nationalIdImage = json['national_id_image'];
    provider = json['provider'];
    providerId = json['provider_id'];
    local = json['local'];
    role = json['role'];
    emailVerifiedAt = json['email_verified_at'];
    phoneVerifiedAt = json['phone_verified_at'];
    approvedByAdmin = json['approved_by_admin'];
    approvedBy = json['approved_by'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
    nationalIdUrl = json['national_id_url'];
    roleName = json['role_name'];
  }
  String? id;
  String? name;
  String? email;
  String? phone;
  dynamic address;
  dynamic image;
  int? online;
  dynamic nationalId;
  dynamic nationalIdImage;
  dynamic provider;
  dynamic providerId;
  String? local;
  String? role;
  dynamic emailVerifiedAt;
  dynamic phoneVerifiedAt;
  int? approvedByAdmin;
  dynamic approvedBy;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;
  String? nationalIdUrl;
  String? roleName;
}
