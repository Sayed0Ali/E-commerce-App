import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entites/GetCardResponseEntity.dart';

import '../../../failures.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failure, GetCardResponseEntity>> getCart();
  Future<Either<Failure, GetCardResponseEntity>> deleteItemsCart(String productId);
  Future<Either<Failure, GetCardResponseEntity>> updateCountCart(String productId,int count);

}
