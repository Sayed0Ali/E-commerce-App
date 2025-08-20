import 'package:e_commerce/domain/entites/login_response_entity.dart';

class LoginResponseDm extends LoginResponseEntity{
  LoginResponseDm({
      super.message,
      super.user,
      super.token,
  this.statusMessage});

  LoginResponseDm.fromJson(dynamic json) {
    message = json['message'];
    statusMessage = json['statusMessage'];
    user = json['user'] != null ? loginUserDm.fromJson(json['user']) : null;
    token = json['token'];
  }


String? statusMessage;

}

class loginUserDm extends loginUserEntity{
  loginUserDm({
      super.name,
      super.email,
      this.role,});

  loginUserDm.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

}