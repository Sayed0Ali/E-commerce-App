import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entites/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/entites/AddToWishListResponseEntity.dart';
import 'package:e_commerce/domain/entites/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToWishListUseCase {
  HomeRepository homeRepository;
  AddToWishListUseCase({required this.homeRepository});
  Future<Either<Failure, WishListResponseEntity>> invoke(
    String productId,
  ) {
    return homeRepository.addWishList(productId);
  }
}
