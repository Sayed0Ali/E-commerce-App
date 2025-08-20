import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entites/product_response_entity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetAllProductsUseCase{
  HomeRepository homeRepository;
  GetAllProductsUseCase({required this.homeRepository});
 Future<Either<Failure,ProductResponseEntity>> invoke(){
    return homeRepository.getAllProducts();
  }
}
