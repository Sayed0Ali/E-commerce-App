import 'package:e_commerce/domain/entites/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/entites/product_response_entity.dart';
import 'package:e_commerce/domain/failures.dart';

import '../../../../../../domain/entites/AddToWishListResponseEntity.dart';

abstract class ProductsStates {}

class ProductInitialState extends ProductsStates {}

class ProductLoadingState extends ProductsStates {}

class ProductSuccessState extends ProductsStates {
  ProductResponseEntity productResponseEntity;
  ProductSuccessState({required this.productResponseEntity});
}

class ProductErrorState extends ProductsStates {
  Failure failure;
  ProductErrorState({required this.failure});
}

class AddCardLoadingState extends ProductsStates {}

class AddCardSuccessState extends ProductsStates {
  AddToCartResponseEntity addToCartResponseEntity;
  AddCardSuccessState({required this.addToCartResponseEntity});
}

class AddCardErrorState extends ProductsStates {
  Failure failure;
  AddCardErrorState({required this.failure});
}


class AddFavoriteLoadingState extends ProductsStates {}

class AddFavoriteSuccessState extends ProductsStates {
  WishListResponseEntity addToWishListResponseEntity;
  AddFavoriteSuccessState({required this.addToWishListResponseEntity});
}

class AddFavoriteErrorState extends ProductsStates {
  Failure failure;
  AddFavoriteErrorState({required this.failure});
}
