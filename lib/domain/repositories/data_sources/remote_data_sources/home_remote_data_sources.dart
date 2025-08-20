import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entites/GetWishListResponseEntity.dart';

import '../../../entites/AddToCartResponseEntity.dart';
import '../../../entites/AddToWishListResponseEntity.dart';
import '../../../entites/CategoryOrBrandResponseEntity.dart';
import '../../../entites/product_response_entity.dart';
import '../../../failures.dart';

abstract class HomeRemoteDataSources {
  Future<Either<Failure, CategoryOrBrandResponseEntity>> getAllCategories();
  Future<Either<Failure, CategoryOrBrandResponseEntity>> getAllBrands();
  Future<Either<Failure, ProductResponseEntity>> getAllProducts();
  Future<Either<Failure, AddToCartResponseEntity>> addToCard(String productId);
  Future<Either<Failure, WishListResponseEntity>> addWishList(String productId);
  Future<Either<Failure, GetWishListResponseEntity>> getFavorite();
  Future<Either<Failure, WishListResponseEntity>> deleteFavorite(
    String productId,
  );
}
