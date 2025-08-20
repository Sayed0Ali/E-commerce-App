import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/domain/entites/product_response_entity.dart';
import 'package:e_commerce/feature/ui/home_screen/tabs/proudects_tab/cubit/product_view_model.dart';
import 'package:e_commerce/feature/ui/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/product_states.dart';

class ProductTabItem extends StatelessWidget {
  ProductEntity productEntity;
  ProductTabItem({required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primary30Opacity, width: 2),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  imageUrl: productEntity.imageCover ?? "",
                  width: 191.w,
                  height: 130.h,
                  errorWidget:
                      (context, url, error) =>
                          const Icon(Icons.error, color: AppColors.redColor),
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) => const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryDark,
                        ),
                      ),
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: CircleAvatar(
                  backgroundColor: AppColors.whiteColor,
                  radius: 20.r,
                  child: Center(
                    child: BlocBuilder<ProductViewModel, ProductsStates>(
                      builder: (context, state) {
                        bool isInWishList = ProductViewModel.get(
                          context,
                        ).wishListItems.contains(productEntity.id ?? "");

                        return IconButton(
                          onPressed: () {
                            ProductViewModel.get(
                              context,
                            ).addToWishList(productEntity.id ?? "");
                          },
                          color: AppColors.primaryColor,
                          padding: EdgeInsets.zero,
                          iconSize: 30.r,
                          icon: Icon(
                            isInWishList
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.w),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                CustomText(text: productEntity.title ?? "", fontSize: 12.sp),
                SizedBox(height: 2.h),
                CustomText(
                  text: productEntity.description ?? "",
                  fontSize: 12.sp,
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    CustomText(text: 'EGP ${productEntity.price}'),
                    SizedBox(width: 8.w),
                    CustomText(
                      text: '${productEntity.quantity}',
                      textStyle: AppStyles.regular11SalePrice.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomText(
                      text: "Review(${productEntity.ratingsAverage})",
                      fontSize: 12.sp,
                    ),
                    Icon(Icons.star, color: AppColors.yellowColor, size: 25.sp),
                    const Spacer(flex: 1),
                    InkWell(
                      onTap: () {
                        ProductViewModel.get(
                          context,
                        ).addToCard(productEntity.id ?? "");
                      },
                      splashColor: AppColors.transparentColor,
                      child: Icon(
                        Icons.add_circle,
                        size: 32.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
