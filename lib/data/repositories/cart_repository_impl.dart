import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entites/GetCardResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/repositories/cart/cart_repository.dart';
import 'package:e_commerce/domain/repositories/data_sources/remote_data_sources/cart_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource cartRemoteDataSource;
  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failure, GetCardResponseEntity>> getCart() async {
    var either = await cartRemoteDataSource.getCart();
    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Failure, GetCardResponseEntity>> deleteItemsCart(
    String productId,
  ) async {
    var either = await cartRemoteDataSource.deleteItemsCart(productId);
    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Failure, GetCardResponseEntity>> updateCountCart(
    String productId,
    int count,
  ) async {
    var either = await cartRemoteDataSource.updateCountCart(productId, count);
    return either.fold((error) => left(error), (response) => right(response));
  }
}
