import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/feature/ui/cart_screen/cart_item.dart';
import 'package:e_commerce/feature/ui/cart_screen/cubit/cart_states.dart';
import 'package:e_commerce/feature/ui/cart_screen/cubit/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/utils/app_styles.dart';
import '../../../di/di.dart';

class CartScreen extends StatelessWidget {
  CartViewModel viewModel = getIt<CartViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Details", style: AppStyles.semi20Primary),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primaryColor, size: 30.sp),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
              color: AppColors.primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              size: 30,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
      body: BlocBuilder<CartViewModel, CartStates>(
        bloc: CartViewModel.get(context)..getCart(),
        builder: (context, state) {
          if (state is CartSuccessState) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                     // Fluttertoast.showToast(msg: 'Updated Successfully');
                      return CartItem(
                        productsEntity:
                            state.getCardResponseEntity.data!.products![index],
                      );
                    },
                    itemCount:
                        state.getCardResponseEntity.data!.products!.length,
                  ),
                ),

                /// الـ Box بتاع Total + Checkout
                Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Texts
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Price',
                              style: AppStyles.light18HintText,
                            ),
                            Text(
                              "EGP ${state.getCardResponseEntity.data!.totalCartPrice}", // اربطها بالـ state
                              style: AppStyles.semi20Primary,
                            ),
                          ],
                        ),

                        /// Button
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 12.h,
                            ),
                          ),
                          onPressed: () {},
                          label: Text(
                            "Check out",
                            style: AppStyles.medium18White,
                          ),
                          icon: Icon(
                            Icons.arrow_right_alt_outlined,
                            color: Colors.white,
                            size: 25.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (state is CartLoadingState) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          } else if (state is CartErrorState) {
            return Text(state.failure.message);
          } else {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }
        },
      ),
    );
  }
}
