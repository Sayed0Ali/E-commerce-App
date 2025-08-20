import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../di/di.dart';
import 'cubit/favorite_view_model.dart';
import 'cubit/favorite_states.dart';

class FavoriteTab extends StatelessWidget {
  FavoriteViewModel viewModel = getIt<FavoriteViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteViewModel, FavoriteStates>(
      bloc: viewModel..getWishList(),
      builder: (context, state) {
        if (state is FavoriteLoadingState) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        }

        if (state is FavoriteErrorState) {
          return Center(child: Text("Error: ${state.failure.message}"));
        }

        if (viewModel.wishListItems.isEmpty) {
          return Center(
            child: Text(
              "No items in wishlist yet",
              style: AppStyles.semi20Primary,
            ),
          );
        }

        return ListView.builder(
          itemCount: viewModel.wishListItems.length,
          itemBuilder: (context, index) {
            var item = viewModel.wishListItems[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: Container(
                height: 130.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.r),
                  border: Border.all(
                    color: AppColors.primary30Opacity,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: AppColors.primary30Opacity,
                          width: 1,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: Image.network(
                          item.imageCover ?? "",
                          width: 130.w,
                          height: 145.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 8.h,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: AutoSizeText(
                                    item.title ?? "",
                                    style: AppStyles.medium18HeadLine,
                                  ),
                                ),

                                IconButton(
                                  onPressed: () {
                                    viewModel.deleteWishItem(item.id ?? "");
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: AppColors.primaryColor,
                                    size: 25.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "EGP ${item.price ?? 0}",
                                  style: AppStyles.medium18HeadLine,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.h,
                                      vertical: 8.w,
                                    ),
                                    child: Text('Add To Cart',style: AppStyles.medium18White,),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
