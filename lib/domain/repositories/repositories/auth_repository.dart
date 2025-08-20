import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entites/login_response_entity.dart';
import 'package:e_commerce/domain/entites/register_response_entity.dart';
import 'package:e_commerce/domain/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, RegisterResponseEntity>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  );
  Future<Either<Failure, LoginResponseEntity>> login(
    String email,
    String password,
  );
}
