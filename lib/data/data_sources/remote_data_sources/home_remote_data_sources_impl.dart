import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_manger.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/cache/shared_preferance_utils.dart';
import 'package:e_commerce/data/model/AddCartResponseDm.dart';
import 'package:e_commerce/data/model/AddToWishListDm.dart';
import 'package:e_commerce/data/model/CategoryOrBrandsResponseDM.dart';
import 'package:e_commerce/data/model/GetWishListResponseDm.dart';
import 'package:e_commerce/data/model/Product_response_dm.dart';
import 'package:e_commerce/domain/entites/product_response_entity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/repositories/data_sources/remote_data_sources/home_remote_data_sources.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSources)
class HomeRemoteDataSourcesImpl implements HomeRemoteDataSources {
  ApiManger apiManger;

  HomeRemoteDataSourcesImpl({required this.apiManger});
  @override
  Future<Either<Failure, CategoryOrBrandsResponseDm>> getAllCategories() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var response = await apiManger.getData(endPoint: EndPoints.category);
        var getAllCategoriesResponse = CategoryOrBrandsResponseDm.fromJson(
          response.data,
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getAllCategoriesResponse);
        } else {
          return Left(ServerFailure(getAllCategoriesResponse.message!));
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
  Future<Either<Failure, CategoryOrBrandsResponseDm>> getAllBrands() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var response = await apiManger.getData(endPoint: EndPoints.brands);
        var getAllBrandsResponse = CategoryOrBrandsResponseDm.fromJson(
          response.data,
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getAllBrandsResponse);
        } else {
          return Left(ServerFailure(getAllBrandsResponse.message!));
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
  Future<Either<Failure, ProductResponseEntity>> getAllProducts() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var response = await apiManger.getData(endPoint: EndPoints.products);
        var getAllProductsResponse = ProductResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getAllProductsResponse);
        } else {
          return Left(ServerFailure(getAllProductsResponse.message!));
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
  Future<Either<Failure, AddCartResponseDm>> addToCard(String productId) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManger.postData(
          endPoint: EndPoints.addCard,
          body: {'productId': productId},
          headers: {'token': token},
        );
        var addCardResponse = AddCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(addCardResponse);
        } else {
          return Left(ServerFailure(addCardResponse.message!));
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
  Future<Either<Failure, WishListDm>> addWishList(String productId) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManger.postData(
          endPoint: EndPoints.addWishList,
          body: {'productId': productId},
          headers: {'token': token},
        );
        var addWishListResponse = WishListDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(addWishListResponse);
        } else {
          return Left(ServerFailure(addWishListResponse.message!));
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
  Future<Either<Failure, WishListDm>> deleteFavorite(String productId) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManger.deleteData(
          endPoint: '${EndPoints.addWishList}/$productId',
          headers: {'token': token},
        );
        var deleteWishList = WishListDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(deleteWishList);
        } else {
          return Left(ServerFailure(deleteWishList.message!));
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
  Future<Either<Failure, GetWishListDm>> getFavorite() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManger.getData(
          endPoint: EndPoints.addWishList,
          headers: {'token': token},
        );
        var getWishListResponse = GetWishListDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getWishListResponse);
        } else {
          return Left(ServerFailure(getWishListResponse.message!));
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
