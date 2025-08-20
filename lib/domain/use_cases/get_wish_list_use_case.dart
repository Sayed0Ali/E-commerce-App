import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entites/GetWishListResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetWishListUseCase {
  HomeRepository homeRepository;
  GetWishListUseCase({required this.homeRepository});
  Future<Either<Failure, GetWishListResponseEntity>> invoke() {
    return homeRepository.getFavorite();
  }
}
