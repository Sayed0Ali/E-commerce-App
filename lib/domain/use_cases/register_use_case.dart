import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entites/register_response_entity.dart';
import 'package:e_commerce/domain/repositories/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
@injectable
class RegisterUseCase {
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});
  Future<Either<Failure, RegisterResponseEntity>> invoke(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) {
    return authRepository.register(name, email, password, rePassword, phone);
  }
}
