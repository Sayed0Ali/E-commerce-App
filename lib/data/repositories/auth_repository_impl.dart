import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entites/login_response_entity.dart';
import 'package:e_commerce/domain/entites/register_response_entity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/repositories/data_sources/remote_data_sources/auth_remote_data_source.dart';
import 'package:e_commerce/domain/repositories/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDateSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, RegisterResponseEntity>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    var either = await authRemoteDataSource.register(
      name,
      email,
      password,
      rePassword,
      phone,
    );
    print({
      "name": name,
      "email": email,
      "password": password,
      "rePassword": rePassword,
      "phone": phone,
    });

    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failure, LoginResponseEntity>> login(
   String password,
    String email,
  ) async {
    var either = await authRemoteDataSource.login(password, email);


    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
