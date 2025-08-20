import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/entites/GetCardResponseEntity.dart';
import 'package:e_commerce/domain/use_cases/delete_items_card_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_card_use_case.dart';
import 'package:e_commerce/domain/use_cases/update_count_card_use_case.dart';
import 'package:e_commerce/feature/ui/cart_screen/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartViewModel extends Cubit<CartStates> {
  GetCardUseCase getCardUseCase;
  DeleteItemsCardUseCase deleteItemsCardUseCase;
  UpdateCountCardUseCase updateCountCardUseCase;
  CartViewModel({
    required this.getCardUseCase,
    required this.deleteItemsCardUseCase,
    required this.updateCountCardUseCase
  }) : super(CartInitialState());
  //todo hold data handle logic
  List<GetProductsEntity> cartItemsList = [];
  void getCart() async {
    var either = await getCardUseCase.invoke();
    either.fold(
      (error) {
        emit(CartErrorState(failure: error));
      },
      (response) {
        cartItemsList = response.data!.products!;
        emit(CartSuccessState(getCardResponseEntity: response));
      },
    );
  }

  static CartViewModel get(context) => BlocProvider.of<CartViewModel>(context);

  void deleteCart(String productId) async {
    //emit(DeleteItemsInCartLoadingState());
    var either = await deleteItemsCardUseCase.invoke(productId);

    either.fold(
      (error) {
        emit(DeleteItemsInCartErrorState(failure: error));
      },
      (response) {
        cartItemsList = response.data!.products!;
        print('deleted success');
        emit(CartSuccessState(getCardResponseEntity: response));
      },
    );
  }
  void updateCountInCart(String productId, int count) async {
   // emit(DeleteItemsInCartLoadingState());
    var either = await updateCountCardUseCase.invoke(productId, count);

    either.fold(
          (error) {
        emit(UpdateCountCartErrorState(failure: error));


      },
          (response) {
        cartItemsList = response.data!.products!;
        print('Updated success');
        emit(CartSuccessState(getCardResponseEntity: response));
      },
    );
  }
}
