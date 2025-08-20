import 'package:e_commerce/core/cache/shared_preferance_utils.dart';
import 'package:e_commerce/feature/ui/cart_screen/cart_screen.dart';
import 'package:e_commerce/feature/ui/cart_screen/cubit/cart_view_model.dart';
import 'package:e_commerce/feature/ui/home_screen/tabs/proudects_tab/cubit/product_view_model.dart';
import 'package:e_commerce/feature/ui/home_screen/tabs/proudects_tab/product_details.dart';
import 'package:e_commerce/feature/ui/home_screen/tabs/proudects_tab/proudcts_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/utils/app_routs.dart';
import 'core/utils/my_bloc_observer.dart';
import 'di/di.dart';
import 'feature/ui/auth/login/login_screen.dart';
import 'feature/ui/auth/register/register_screen.dart';
import 'feature/ui/home_screen/home_screen.dart';
import 'feature/ui/home_screen/tabs/favorite_tab/cubit/favorite_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await SharedPreferenceUtils.init();
  var name = SharedPreferenceUtils.getData(key: 'name');
  var token = SharedPreferenceUtils.getData(key: 'token');
  String routName;
  if (token == null) {
    routName = AppRoutes.loginRouten;
  } else {
    routName = AppRoutes.homeRoute;
  }
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ProductViewModel>()),
        BlocProvider(create: (context) => getIt<CartViewModel>()),
        BlocProvider(create: (_) => getIt<FavoriteViewModel>()),

      ],
      child: MyApp(routName: routName),
    ),
  );
}

class MyApp extends StatelessWidget {
  String routName;

  MyApp({required this.routName});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(),
            initialRoute: routName,
            routes: {
              AppRoutes.loginRouten: (context) => LoginScreen(),

              AppRoutes.homeRoute: (context) => HomeScreen(),
              AppRoutes.registerRoute: (context) => RegisterScreen(),
              AppRoutes.productRoute: (context) => ProudctsTab(),
              AppRoutes.productDetails: (context) => ProductDetails(),
              AppRoutes.cartRoute: (context) => CartScreen(),
            },
          ),
    );
  }
}
