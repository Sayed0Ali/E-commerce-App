import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_manger.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/data/model/GetCardResponseDm.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:injectable/injectable.dart';
import '../../../core/cache/shared_preferance_utils.dart';
import '../../../domain/repositories/data_sources/remote_data_sources/cart_remote_data_source.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiManger apiManger;

  CartRemoteDataSourceImpl({required this.apiManger});

  @override
  Future<Either<Failure, GetCardResponseDm>> getCart() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManger.getData(
          endPoint: EndPoints.getCart,
          headers: {'token': token},
        );
        var getCartResponse = GetCardResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getCartResponse);
        } else {
          return Left(ServerFailure(getCartResponse.message!));
        }
      } else {
        // todo : no internet connection
        return Left(
          NetworkFailure('No Internet Connection, Please Check Internet.'),
        );
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetCardResponseDm>> deleteItemsCart(
    String productId,
  ) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManger.deleteData(
          endPoint: '${EndPoints.getCart}/$productId',
          headers: {'token': token},
        );
        var deleteCartResponse = GetCardResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(deleteCartResponse);
        } else {
          return Left(ServerFailure(deleteCartResponse.message!));
        }
      } else {
        // todo : no internet connection
        return Left(
          NetworkFailure('No Internet Connection, Please Check Internet.'),
        );
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetCardResponseDm>> updateCountCart(
    String productId,
    int count,
  ) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManger.updateData(
          endPoint: '${EndPoints.getCart}/$productId',
          body: {'count': count},
          headers: {'token': token},
        );
        var updateCartResponse = GetCardResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(updateCartResponse);
        } else {
          return Left(ServerFailure(updateCartResponse.message!));
        }
      } else {
        // todo : no internet connection
        return Left(
          NetworkFailure('No Internet Connection, Please Check Internet.'),
        );
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
