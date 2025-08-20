import 'package:e_commerce/domain/entites/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class CategoryLoadingState extends HomeTabStates {}

class CategorySuccessState extends HomeTabStates {
  CategoryOrBrandResponseEntity categoryResponseEntity;
  CategorySuccessState({required this.categoryResponseEntity});
}

class CategoryErrorState extends HomeTabStates {
  Failure failure;
  CategoryErrorState({required this.failure});
}

class BrandLoadingState extends HomeTabStates {}

class BrandSuccessState extends HomeTabStates {
  CategoryOrBrandResponseEntity categoryResponseEntity;
  BrandSuccessState({required this.categoryResponseEntity});
}

class BrandErrorState extends HomeTabStates {
  Failure failure;
  BrandErrorState({required this.failure});
}
