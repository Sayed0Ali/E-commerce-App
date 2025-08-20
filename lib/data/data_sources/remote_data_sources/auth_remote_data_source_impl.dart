import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_manger.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/data/model/login_response_dm.dart';
import 'package:e_commerce/data/model/register_response_dm.dart';
import 'package:e_commerce/domain/entites/login_response_entity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/repositories/data_sources/remote_data_sources/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDateSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDateSource {
  ApiManger apiManger;
  AuthRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failure, RegisterResponseDm>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    try {
      var response = await apiManger.postData(
        endPoint: EndPoints.signUp,
        body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone,
        },
      );

      var registerResponse = RegisterResponseDm.fromJson(response.data);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(registerResponse);
      } else {
        return Left(ServerFailure(registerResponse.message ?? "Unknown error"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginResponseEntity>> login(
    String password,
    String email,
  ) async {
    try {
      var response = await apiManger.postData(
        endPoint: EndPoints.signIn,
        body: {"email": email, "password": password},
      );

      var loginResponseDm = LoginResponseDm.fromJson(response.data);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(loginResponseDm);
      } else {
        return Left(ServerFailure(loginResponseDm.message ?? "Unknown error"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
