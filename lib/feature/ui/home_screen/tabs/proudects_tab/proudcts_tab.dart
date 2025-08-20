import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routs.dart';
import 'package:e_commerce/feature/ui/home_screen/tabs/proudects_tab/cubit/product_states.dart';
import 'package:e_commerce/feature/ui/home_screen/tabs/proudects_tab/cubit/product_view_model.dart';
import 'package:e_commerce/feature/ui/home_screen/tabs/proudects_tab/proudct_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';

import '../../../../../di/di.dart';
import 'cubit/product_states.dart';
import 'cubit/product_view_model.dart';

@injectable
class ProudctsTab extends StatelessWidget {
  ProductViewModel viewModel = getIt<ProductViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductViewModel, ProductsStates>(
      listener: (context, state) {
        if (state is AddCardSuccessState) {
          Fluttertoast.showToast(
            msg: 'Added Successfully..',
            backgroundColor: AppColors.greenColor,
          );
        } else if (state is AddCardErrorState) {
          Fluttertoast.showToast(
            msg: state.failure.message,
            backgroundColor: AppColors.redColor,
          );
        } else if (state is AddFavoriteSuccessState) {
          Fluttertoast.showToast(
            msg: 'Added to Wishlist',
            backgroundColor: AppColors.greenColor,
          );
        } else if (state is AddFavoriteErrorState) {
          Fluttertoast.showToast(
            msg: state.failure.message,
            backgroundColor: AppColors.redColor,
          );
        }
      },
      child: BlocBuilder<ProductViewModel, ProductsStates>(
        // listener: (context, state) {
        //   // if (state is AddCardSuccessState) {

        //   //   Fluttertoast.showToast(
        //   //     msg: 'Added Successfully..',
        //   //     backgroundColor: AppColors.greenColor,
        //   //   );
        //   // } else if (state is AddCardErrorState) {
        //   //   Fluttertoast.showToast(
        //   //     msg: state.failure.message,
        //   //     backgroundColor: AppColors.redColor,
        //   //   );
        //   // }
        // },
        bloc: viewModel..getAllProducts(),
        builder: (context, state) {
          if (state is ProductErrorState) {
            return Center(child: Text(state.failure.message));
          } else if (state is ProductSuccessState) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: GridView.builder(
                        itemCount: viewModel.productList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 2.8.h,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 16.h,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.productDetails,
                                arguments: viewModel.productList[index],
                              );
                            },
                            child: ProductTabItem(
                              productEntity: viewModel.productList[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryDark),
            );
          }
        },
      ),
    );
  }
}
