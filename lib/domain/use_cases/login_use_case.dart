import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entites/login_response_entity.dart';
import 'package:e_commerce/domain/repositories/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});
  Future<Either<Failure, LoginResponseEntity>> invoke(
    String password,
    String email,
  ) {
    return authRepository.login(email, password);
  }
}
