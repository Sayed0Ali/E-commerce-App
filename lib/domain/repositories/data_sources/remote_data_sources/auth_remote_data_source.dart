import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/failures.dart';

import '../../../entites/login_response_entity.dart';
import '../../../entites/register_response_entity.dart';

abstract class AuthRemoteDateSource {
  Future<Either<Failure, RegisterResponseEntity>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  );
  Future<Either<Failure, LoginResponseEntity>> login(String email, String password);

}
