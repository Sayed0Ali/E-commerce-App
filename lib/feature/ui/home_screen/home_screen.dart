import 'package:e_commerce/core/utils/app_routs.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/ui/cart_screen/cart_screen.dart';
import 'package:e_commerce/feature/ui/home_screen/cubit/home_states.dart';
import 'package:e_commerce/feature/ui/home_screen/cubit/home_view_model.dart';
import 'package:e_commerce/feature/ui/home_screen/tabs/proudects_tab/cubit/product_states.dart';
import 'package:e_commerce/feature/ui/home_screen/tabs/proudects_tab/cubit/product_view_model.dart';
import 'package:e_commerce/feature/ui/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          appBar: _buildAppBar(viewModel.selectedIndex),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
            child: Theme(
              data: Theme.of(
                context,
              ).copyWith(canvasColor: AppColors.primaryColor),
              child: BottomAppBar(
                color: AppColors.primaryColor,
                padding: EdgeInsets.zero,
                child: SingleChildScrollView(
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    elevation: 0,

                    currentIndex: viewModel.selectedIndex,
                    onTap: viewModel.bottomNaOnTap,

                    iconSize: 24.sp,
                    selectedItemColor: AppColors.primary30Opacity,
                    items: [
                      buildBottomNavitems(
                        iconName: AppAssets.iconHomeSelected,
                        index: 0,
                        iconSelectedName: AppAssets.iconHome,
                      ),
                      buildBottomNavitems(
                        iconName: AppAssets.productsIcon,
                        index: 1,
                        iconSelectedName: AppAssets.proudectsIconSelected,
                      ),
                      buildBottomNavitems(
                        iconName: AppAssets.favoriteIcon,
                        index: 2,
                        iconSelectedName: AppAssets.favoriteIcon,
                      ),
                      buildBottomNavitems(
                        iconName: AppAssets.userIcon,
                        index: 3,
                        iconSelectedName: AppAssets.userIconSelected,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          body: viewModel.bodyList[viewModel.selectedIndex],
        );
      },
    );
  }

  BottomNavigationBarItem buildBottomNavitems({
    required int index,
    required String iconName,
    //required String labelName,
    required String iconSelectedName,
  }) {
    return BottomNavigationBarItem(
      icon: CircleAvatar(
        foregroundColor:
            viewModel.selectedIndex == index
                ? AppColors.primaryColor
                : AppColors.whiteColor,
        backgroundColor:
            viewModel.selectedIndex == index
                ? AppColors.whiteColor
                : AppColors.transparentColor,
        radius: 24.r,
        child: ImageIcon(
          AssetImage(
            viewModel.selectedIndex == index ? iconSelectedName : iconName,
          ),
        ),
      ),
      label: "",
    );
  }

  PreferredSizeWidget _buildAppBar(int index) {
    return AppBar(
      surfaceTintColor: AppColors.transparentColor,
      elevation: 0,
      toolbarHeight: index != 3 ? 120.h : kToolbarHeight,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 8.h),
            child: Image.asset(
              AppAssets.favoriteIconSelected,
              width: 60.w,
              height: 25.h,
            ),
          ),
          if (index != 3)
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: 'What do you search for ?',
                    style: AppStyles.regular14Text,
                    borderColor: AppColors.primaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.cartRoute);
                  },
                  icon: BlocBuilder<ProductViewModel, ProductsStates>(
                    builder: (context, state) {
                      return Badge(
                        backgroundColor: AppColors.greenColor,
                        alignment: AlignmentDirectional.topStart,
                        label: Text(
                          ProductViewModel.get(
                            context,
                          ).numOfCardItem.toString(),
                        ),
                        child: ImageIcon(
                          const AssetImage(AppAssets.iconShopping),
                          size: 40.sp,
                          color: AppColors.primaryColor,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
