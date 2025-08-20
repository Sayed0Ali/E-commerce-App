import 'package:e_commerce/domain/entites/AddToWishListResponseEntity.dart';
import 'package:e_commerce/domain/entites/GetCardResponseEntity.dart';
import 'package:e_commerce/domain/entites/GetWishListResponseEntity.dart';
import 'package:e_commerce/domain/failures.dart';

abstract class FavoriteStates {}

class FavoriteInitialState extends FavoriteStates {}

class FavoriteLoadingState extends FavoriteStates {}

class FavoriteSuccessState extends FavoriteStates {
  GetWishListResponseEntity getWishListResponseEntity;
  FavoriteSuccessState({required this.getWishListResponseEntity});
}

class FavoriteErrorState extends FavoriteStates {
  Failure failure;
  FavoriteErrorState({required this.failure});
}

class DeleteFavoriteLoadingState extends FavoriteStates {}

class DeleteFavoriteSuccessState extends FavoriteStates {
  WishListResponseEntity addToWishListResponseEntity;
  DeleteFavoriteSuccessState({required this.addToWishListResponseEntity});
}

class DeleteFavoriteErrorState extends FavoriteStates {
  Failure failure;
  DeleteFavoriteErrorState({required this.failure});
}
