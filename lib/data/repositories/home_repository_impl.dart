import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entites/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/entites/AddToWishListResponseEntity.dart';
import 'package:e_commerce/domain/entites/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/domain/entites/GetWishListResponseEntity.dart';
import 'package:e_commerce/domain/entites/product_response_entity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/repositories/data_sources/remote_data_sources/home_remote_data_sources.dart';
import 'package:e_commerce/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSources homeRemoteDataSources;
  HomeRepositoryImpl({required this.homeRemoteDataSources});
  @override
  Future<Either<Failure, CategoryOrBrandResponseEntity>>
  getAllCategories() async {
    var either = await homeRemoteDataSources.getAllCategories();
    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Failure, CategoryOrBrandResponseEntity>> getAllBrands() async {
    var either = await homeRemoteDataSources.getAllBrands();
    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Failure, ProductResponseEntity>> getAllProducts() async {
    var either = await homeRemoteDataSources.getAllProducts();
    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Failure, AddToCartResponseEntity>> addToCard(
    String productId,
  ) async {
    var either = await homeRemoteDataSources.addToCard(productId);
    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Failure, WishListResponseEntity>> addWishList(
    String productId,
  ) async {
    var either = await homeRemoteDataSources.addWishList(productId);
    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Failure, WishListResponseEntity>> deleteFavorite(
    String productId,
  ) async {
    var either = await homeRemoteDataSources.deleteFavorite(productId);
    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Failure, GetWishListResponseEntity>> getFavorite() async {
    var either = await homeRemoteDataSources.getFavorite();
    return either.fold((error) => left(error), (response) => right(response));
  }
}
