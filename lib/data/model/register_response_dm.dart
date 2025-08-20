import 'package:e_commerce/domain/entites/register_response_entity.dart';

class RegisterResponseDm extends RegisterResponseEntity{
  RegisterResponseDm({super.message, super.user, super.token,super.statusMessage});

  RegisterResponseDm.fromJson(dynamic json) {
    message = json['message'];
    statusMessage= json['statusMessage'];
    user = json['user'] != null ? UserDm.fromJson(json['user']) : null;
    token = json['token'];
  }



}

class UserDm extends UserEntity{
  UserDm({super.name, super.email, this.role});

  UserDm.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;


}
