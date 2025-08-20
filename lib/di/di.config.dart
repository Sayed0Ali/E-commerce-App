// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_manger.dart' as _i993;
import '../data/data_sources/remote_data_sources/auth_remote_data_source_impl.dart'
    as _i152;
import '../data/data_sources/remote_data_sources/cart_remote_data_source_impl.dart'
    as _i268;
import '../data/data_sources/remote_data_sources/home_remote_data_sources_impl.dart'
    as _i269;
import '../data/repositories/auth_repository_impl.dart' as _i74;
import '../data/repositories/cart_repository_impl.dart' as _i230;
import '../data/repositories/home_repository_impl.dart' as _i158;
import '../domain/repositories/cart/cart_repository.dart' as _i953;
import '../domain/repositories/data_sources/remote_data_sources/auth_remote_data_source.dart'
    as _i268;
import '../domain/repositories/data_sources/remote_data_sources/cart_remote_data_source.dart'
    as _i4;
import '../domain/repositories/data_sources/remote_data_sources/home_remote_data_sources.dart'
    as _i816;
import '../domain/repositories/home/home_repository.dart' as _i855;
import '../domain/repositories/repositories/auth_repository.dart' as _i302;
import '../domain/use_cases/add_card_use_case.dart' as _i788;
import '../domain/use_cases/add_to_wish_list_use_case.dart' as _i626;
import '../domain/use_cases/delete_items_card_use_case.dart' as _i690;
import '../domain/use_cases/delete_wish_list_use_case.dart' as _i420;
import '../domain/use_cases/get_all_brands_use_case.dart' as _i823;
import '../domain/use_cases/get_all_categories_use_case.dart' as _i557;
import '../domain/use_cases/get_all_products_use_case.dart' as _i960;
import '../domain/use_cases/get_card_use_case.dart' as _i514;
import '../domain/use_cases/get_wish_list_use_case.dart' as _i792;
import '../domain/use_cases/login_use_case.dart' as _i826;
import '../domain/use_cases/register_use_case.dart' as _i772;
import '../domain/use_cases/update_count_card_use_case.dart' as _i1054;
import '../feature/ui/auth/login/cubit/login_view_model.dart' as _i702;
import '../feature/ui/auth/register/cubit/register_view_model.dart' as _i601;
import '../feature/ui/cart_screen/cubit/cart_view_model.dart' as _i158;
import '../feature/ui/home_screen/tabs/favorite_tab/cubit/favorite_view_model.dart'
    as _i384;
import '../feature/ui/home_screen/tabs/home_tab/cubit/home_tab_view_model.dart'
    as _i115;
import '../feature/ui/home_screen/tabs/proudects_tab/cubit/product_view_model.dart'
    as _i534;
import '../feature/ui/home_screen/tabs/proudects_tab/proudcts_tab.dart'
    as _i833;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i833.ProudctsTab>(() => _i833.ProudctsTab());
    gh.singleton<_i993.ApiManger>(() => _i993.ApiManger());
    gh.factory<_i4.CartRemoteDataSource>(
      () => _i268.CartRemoteDataSourceImpl(apiManger: gh<_i993.ApiManger>()),
    );
    gh.factory<_i268.AuthRemoteDateSource>(
      () => _i152.AuthRemoteDataSourceImpl(apiManger: gh<_i993.ApiManger>()),
    );
    gh.factory<_i302.AuthRepository>(
      () => _i74.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i268.AuthRemoteDateSource>(),
      ),
    );
    gh.factory<_i816.HomeRemoteDataSources>(
      () => _i269.HomeRemoteDataSourcesImpl(apiManger: gh<_i993.ApiManger>()),
    );
    gh.factory<_i953.CartRepository>(
      () => _i230.CartRepositoryImpl(
        cartRemoteDataSource: gh<_i4.CartRemoteDataSource>(),
      ),
    );
    gh.factory<_i855.HomeRepository>(
      () => _i158.HomeRepositoryImpl(
        homeRemoteDataSources: gh<_i816.HomeRemoteDataSources>(),
      ),
    );
    gh.factory<_i826.LoginUseCase>(
      () => _i826.LoginUseCase(authRepository: gh<_i302.AuthRepository>()),
    );
    gh.factory<_i772.RegisterUseCase>(
      () => _i772.RegisterUseCase(authRepository: gh<_i302.AuthRepository>()),
    );
    gh.factory<_i690.DeleteItemsCardUseCase>(
      () => _i690.DeleteItemsCardUseCase(
        cartRepository: gh<_i953.CartRepository>(),
      ),
    );
    gh.factory<_i514.GetCardUseCase>(
      () => _i514.GetCardUseCase(cartRepository: gh<_i953.CartRepository>()),
    );
    gh.factory<_i1054.UpdateCountCardUseCase>(
      () => _i1054.UpdateCountCardUseCase(
        cartRepository: gh<_i953.CartRepository>(),
      ),
    );
    gh.factory<_i601.RegisterViewModel>(
      () =>
          _i601.RegisterViewModel(registerUseCase: gh<_i772.RegisterUseCase>()),
    );
    gh.factory<_i702.LoginViewModel>(
      () => _i702.LoginViewModel(loginUseCase: gh<_i826.LoginUseCase>()),
    );
    gh.factory<_i788.AddCardUseCase>(
      () => _i788.AddCardUseCase(homeRepository: gh<_i855.HomeRepository>()),
    );
    gh.factory<_i626.AddToWishListUseCase>(
      () => _i626.AddToWishListUseCase(
        homeRepository: gh<_i855.HomeRepository>(),
      ),
    );
    gh.factory<_i420.DeleteWishListUseCase>(
      () => _i420.DeleteWishListUseCase(
        homeRepository: gh<_i855.HomeRepository>(),
      ),
    );
    gh.factory<_i823.GetAllBrandsUseCase>(
      () =>
          _i823.GetAllBrandsUseCase(homeRepository: gh<_i855.HomeRepository>()),
    );
    gh.factory<_i557.GetAllCategoriesUseCase>(
      () => _i557.GetAllCategoriesUseCase(
        homeRepository: gh<_i855.HomeRepository>(),
      ),
    );
    gh.factory<_i960.GetAllProductsUseCase>(
      () => _i960.GetAllProductsUseCase(
        homeRepository: gh<_i855.HomeRepository>(),
      ),
    );
    gh.factory<_i792.GetWishListUseCase>(
      () =>
          _i792.GetWishListUseCase(homeRepository: gh<_i855.HomeRepository>()),
    );
    gh.factory<_i158.CartViewModel>(
      () => _i158.CartViewModel(
        getCardUseCase: gh<_i514.GetCardUseCase>(),
        deleteItemsCardUseCase: gh<_i690.DeleteItemsCardUseCase>(),
        updateCountCardUseCase: gh<_i1054.UpdateCountCardUseCase>(),
      ),
    );
    gh.factory<_i534.ProductViewModel>(
      () => _i534.ProductViewModel(
        addToWishListUseCase: gh<_i626.AddToWishListUseCase>(),
        getAllProductsUseCase: gh<_i960.GetAllProductsUseCase>(),
        addCardUseCase: gh<_i788.AddCardUseCase>(),
      ),
    );
    gh.factory<_i384.FavoriteViewModel>(
      () => _i384.FavoriteViewModel(
        getWishListUseCase: gh<_i792.GetWishListUseCase>(),
        deleteWishListUseCase: gh<_i420.DeleteWishListUseCase>(),
      ),
    );
    gh.factory<_i115.HomeTabViewModel>(
      () => _i115.HomeTabViewModel(
        getAllCategoriesUseCase: gh<_i557.GetAllCategoriesUseCase>(),
        getAllBrandsUseCase: gh<_i823.GetAllBrandsUseCase>(),
      ),
    );
    return this;
  }
}
