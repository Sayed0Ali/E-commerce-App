import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/entites/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/domain/use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce/feature/ui/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;
  HomeTabViewModel({
    required this.getAllCategoriesUseCase,
    required this.getAllBrandsUseCase,
  }) : super(HomeTabInitialState());
  //todo hold data handle logic
  List<CategoryOrBrandEntity> categoryList = [];
  List<CategoryOrBrandEntity> brandList = [];
  void getAllCategories() async {
    emit(CategoryLoadingState());
    var either = await getAllCategoriesUseCase.invoke();
    either.fold(
      (error) {
        emit(CategoryErrorState(failure: error));
      },
      (response) {
        categoryList = response.data!;
        emit(CategorySuccessState(categoryResponseEntity: response));
      },
    );
  }

  void getAllBrands() async {
    emit(BrandLoadingState());
    var either = await getAllBrandsUseCase.invoke();
    either.fold(
      (error) {
        emit(BrandErrorState(failure: error));
      },
      (response) {
        brandList = response.data!;
        emit(BrandSuccessState(categoryResponseEntity: response));
      },
    );
  }
}
