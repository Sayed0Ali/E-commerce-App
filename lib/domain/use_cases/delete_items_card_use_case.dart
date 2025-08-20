import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entites/GetCardResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteItemsCardUseCase {
  CartRepository cartRepository;
  DeleteItemsCardUseCase({required this.cartRepository});
  Future<Either<Failure, GetCardResponseEntity>> invoke(String productId) {
    return cartRepository.deleteItemsCart( productId);
  }
}
