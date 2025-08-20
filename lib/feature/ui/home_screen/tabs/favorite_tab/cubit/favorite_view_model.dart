import 'package:e_commerce/domain/entites/GetWishListResponseEntity.dart';
import 'package:e_commerce/domain/use_cases/delete_wish_list_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_wish_list_use_case.dart';

import 'package:e_commerce/feature/ui/home_screen/tabs/favorite_tab/cubit/favorite_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoriteViewModel extends Cubit<FavoriteStates> {
  GetWishListUseCase getWishListUseCase;
  DeleteWishListUseCase deleteWishListUseCase;
  FavoriteViewModel({
    required this.getWishListUseCase,
    required this.deleteWishListUseCase,
  }) : super(FavoriteInitialState());
  //todo hold data handle logic
  List<GetWishListDataEntity> wishListItems = [];

  void getWishList() async {
    var either = await getWishListUseCase.invoke();
    either.fold(
      (error) {
        emit(FavoriteErrorState(failure: error));
      },
      (response) {
        wishListItems = (response.data ?? []).cast<GetWishListDataEntity>();
        emit(FavoriteSuccessState(getWishListResponseEntity: response));
      },
    );
  }

  static FavoriteViewModel get(context) =>
      BlocProvider.of<FavoriteViewModel>(context);
  void deleteWishItem(String productId) async {
    //emit(DeleteItemsInCartLoadingState());
    var either = await deleteWishListUseCase.invoke(productId);

    either.fold(
      (error) {
        emit(DeleteFavoriteErrorState(failure: error));
      },
      (response) {
        wishListItems.removeWhere((item) => item.id == productId);
        print('deleted success');

        emit(DeleteFavoriteSuccessState(addToWishListResponseEntity: response));
      },
    );
  }
}
