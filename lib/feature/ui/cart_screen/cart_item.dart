import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_routs.dart';
import 'package:e_commerce/domain/entites/GetCardResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../widget/custom_text.dart';
import 'cubit/cart_view_model.dart';

class CartItem extends StatelessWidget {
  GetProductsEntity productsEntity;
  CartItem({required this.productsEntity});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Container(
        height: 142.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: AppColors.primary30Opacity, width: 1),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.primary30Opacity, width: 1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  imageUrl: productsEntity.product!.imageCover ?? "",
                  width: 130.w,
                  height: 145.h,
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
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomText(
                            text: productsEntity.product!.title ?? "",
                            fontColor: AppColors.primaryColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            CartViewModel.get(
                              context,
                            ).deleteCart(productsEntity.product?.id ?? "");
                          },

                          child: Icon(
                            Icons.delete_forever_outlined,
                            color: AppColors.primaryColor,
                            size: 25.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "EGP ${productsEntity.price}",
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
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

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    int count = productsEntity.count!.toInt();
                                    count--;
                                    CartViewModel.get(
                                      context,
                                    ).updateCountInCart(
                                      productsEntity.product?.id ?? "",
                                      count,
                                    );
                                  },
                                  child: Icon(
                                    Icons.remove_circle_outline,
                                    size: 25.sp,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                AutoSizeText(
                                  '${productsEntity.count}',
                                  style: AppStyles.medium18White,
                                ),
                                SizedBox(width: 16.w),
                                InkWell(
                                  onTap: () {
                                    int count = productsEntity.count!.toInt();
                                    count++;
                                    CartViewModel.get(
                                      context,
                                    ).updateCountInCart(
                                      productsEntity.product?.id ?? "",
                                      count,
                                    );
                                  },
                                  child: Icon(
                                    Icons.add_circle_outline,
                                    size: 25.sp,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    //buildItemDetails,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
