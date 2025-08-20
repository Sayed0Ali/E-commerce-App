import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entites/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/entites/AddToWishListResponseEntity.dart';
import 'package:e_commerce/domain/entites/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/domain/entites/GetWishListResponseEntity.dart';
import 'package:e_commerce/domain/entites/product_response_entity.dart';
import 'package:e_commerce/domain/failures.dart';

abstract class HomeRepository {
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
