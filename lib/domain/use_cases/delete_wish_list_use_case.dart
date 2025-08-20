import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entites/AddToWishListResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteWishListUseCase {
  HomeRepository homeRepository;
  DeleteWishListUseCase({required this.homeRepository});
  Future<Either<Failure, WishListResponseEntity>> invoke(String productId) {
    return homeRepository.deleteFavorite(productId);
  }
}
