import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/entites/product_response_entity.dart';
import 'package:e_commerce/domain/use_cases/add_card_use_case.dart';
import 'package:e_commerce/domain/use_cases/add_to_wish_list_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerce/feature/ui/home_screen/tabs/proudects_tab/cubit/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductViewModel extends Cubit<ProductsStates> {
  GetAllProductsUseCase getAllProductsUseCase;
  AddCardUseCase addCardUseCase;
  AddToWishListUseCase addToWishListUseCase;
  ProductViewModel({
    required this.addToWishListUseCase,
    required this.getAllProductsUseCase,
    required this.addCardUseCase,
  }) : super(ProductInitialState());
  List<ProductEntity> productList = [];
  List<String> wishListItems = [];
  int numOfCardItem = 0;
  static ProductViewModel get(context) => BlocProvider.of(context);
  void getAllProducts() async {
    emit(ProductLoadingState());
    var either = await getAllProductsUseCase.invoke();
    either.fold(
      (error) {
        emit(ProductErrorState(failure: error));
      },
      (response) {
        productList = response.data!;
        emit(ProductSuccessState(productResponseEntity: response));
      },
    );
  }

  void addToCard(String productId) async {
    emit(AddCardLoadingState());
    var either = await addCardUseCase.invoke(productId);
    either.fold(
      (error) {
        emit(AddCardErrorState(failure: error));
      },
      (response) {
        numOfCardItem = response.numOfCartItems!.toInt();
        emit(AddCardSuccessState(addToCartResponseEntity: response));
      },
    );
  }

  void addToWishList(productId) async {
    var either = await addToWishListUseCase.invoke(productId);
    either.fold(
          (error) {
        emit(AddFavoriteErrorState(failure: error));
      },
          (response) {
        wishListItems = response.data ?? [];
        emit(AddFavoriteSuccessState(addToWishListResponseEntity: response));
      },
    );
  }
}
