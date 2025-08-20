import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entites/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddCardUseCase {
  HomeRepository homeRepository;
  AddCardUseCase({required this.homeRepository});
  Future<Either<Failure, AddToCartResponseEntity>> invoke(String productId) {
    return homeRepository.addToCard(productId);
  }
}
