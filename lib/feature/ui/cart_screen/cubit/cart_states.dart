import 'package:e_commerce/domain/entites/GetCardResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';

abstract class CartStates {}

class CartInitialState extends CartStates {}

class CartLoadingState extends CartStates {}

class CartSuccessState extends CartStates {
  GetCardResponseEntity getCardResponseEntity;
  CartSuccessState({required this.getCardResponseEntity});
}

class CartErrorState extends CartStates {
  Failure failure;
  CartErrorState({required this.failure});
}

class DeleteItemsInCartLoadingState extends CartStates {}

class DeleteItemsInCartSuccessState extends CartStates {
  GetCardResponseEntity getCardResponseEntity;
  DeleteItemsInCartSuccessState({required this.getCardResponseEntity});
}

class DeleteItemsInCartErrorState extends CartStates {
  Failure failure;
  DeleteItemsInCartErrorState({required this.failure});
}

class UpdateCountCartLoadingState extends CartStates {}

class UpdateCountCartSuccessState extends CartStates {
  GetCardResponseEntity getCardResponseEntity;
  UpdateCountCartSuccessState({required this.getCardResponseEntity});
}

class UpdateCountCartErrorState extends CartStates {
  Failure failure;
  UpdateCountCartErrorState({required this.failure});
}
