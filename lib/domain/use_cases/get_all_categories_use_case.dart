import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entites/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetAllCategoriesUseCase{
  HomeRepository homeRepository;
  GetAllCategoriesUseCase({required this.homeRepository});
 Future<Either<Failure,CategoryOrBrandResponseEntity>> invoke(){
    return homeRepository.getAllCategories();
  }
}