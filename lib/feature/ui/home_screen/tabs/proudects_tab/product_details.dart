import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/domain/entites/product_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/utils/app_colors.dart';

class ProductDetails extends StatefulWidget {
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<Color> color = [
    Colors.red,
    Colors.blueAccent,
    Colors.green,
    Colors.yellow,
  ];

  List<int> size = [35, 38, 39, 40];

  int? selectedSize;

  int? selectedColor;

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments as ProductEntity;
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details", style: AppStyles.semi20Primary),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primaryColor, size: 25.sp),
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
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImageSlideshow(
              indicatorColor: AppColors.primaryColor,
              initialPage: 0,
              indicatorBottomPadding: 15.h,
              indicatorPadding: 8.w,
              indicatorRadius: 5,
              indicatorBackgroundColor: AppColors.whiteColor,
              isLoop: true,
              autoPlayInterval: 3000,
              height: 190.h,
              children:
                  arguments.images!.map((url) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: CachedNetworkImage(
                        imageUrl: url,
                        width: 191.w,
                        height: 130.h,
                        errorWidget:
                            (context, url, error) => const Icon(
                              Icons.error,
                              color: AppColors.redColor,
                            ),
                        fit: BoxFit.cover,
                        placeholder:
                            (context, url) => const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryDark,
                              ),
                            ),
                      ),
                    );
                  }).toList(),
            ),
            SizedBox(height: 6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    arguments.title!,
                    style: AppStyles.medium18HeadLine,
                  ),
                ),
                Text(
                  'EGP${arguments.price}',
                  style: AppStyles.medium18HeadLine,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primaryColor.withOpacity(.3),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.h,
                    vertical: 8.w,
                  ),
                  child: Text(
                    '${arguments.sold} sold',
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.medium14PrimaryDark,
                  ),
                ),
                SizedBox(width: 16.w),
                Icon(Icons.star, color: AppColors.yellowColor, weight: 30.w),
                SizedBox(width: 4.w),
                Expanded(
                  child: Text(
                    "${arguments.ratingsAverage} (${arguments.ratingsQuantity})",
                    style: AppStyles.medium14PrimaryDark,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.h,
                    vertical: 8.w,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.remove_circle_outline,
                          size: 20.w,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      AutoSizeText('3', style: AppStyles.medium18White),
                      SizedBox(width: 16.w),

                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.add_circle_outline,
                          size: 20.w,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Description", style: AppStyles.medium18HeadLine),
                SizedBox(height: 8.h),
                ReadMoreText(
                  arguments.description ?? "",
                  style: AppStyles.medium14LightPrimary,
                  trimExpandedText: 'Read Less',
                  trimCollapsedText: 'Read More',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  colorClickableText: AppColors.primaryColor,
                ),
                SizedBox(height: 16.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Size', style: AppStyles.medium18HeadLine),
                    SizedBox(height: 8.h),
                    SizedBox(
                      height: 45.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: size.length,
                        separatorBuilder:
                            (context, index) => SizedBox(width: 8.w),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = index;
                              });
                            },
                            child: CircleAvatar(
                              radius: 22.r,
                              backgroundColor:
                                  index == selectedSize
                                      ? AppColors.primaryColor
                                      : AppColors.transparentColor,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 9.w,
                                  vertical: 9.h,
                                ),
                                child: Text(
                                  '${size[index]}',
                                  style: AppStyles.regular14Text.copyWith(
                                    color:
                                        index == selectedSize
                                            ? AppColors.whiteColor
                                            : AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Color', style: AppStyles.medium18HeadLine),
                    SizedBox(height: 8.h),
                    SizedBox(
                      height: 45.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: color.length,
                        separatorBuilder:
                            (context, index) => SizedBox(width: 8.w),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedColor = index;
                              });
                            },
                            child: CircleAvatar(
                              radius: 22.r,
                              backgroundColor: color[index],
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 9.w,
                                  vertical: 9.h,
                                ),
                                child:
                                    selectedColor == index
                                        ? Icon(
                                          Icons.check,
                                          color: AppColors.whiteColor,
                                        )
                                        : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Total Price',
                          style: AppStyles.medium18HeadLine.copyWith(
                            color: AppColors.primaryColor.withOpacity(0.6),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'EGP ${arguments.price}',
                          style: AppStyles.semi20Primary,
                        ),
                      ],
                    ),

                    SizedBox(width: 33.w),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17.r),
                          ),
                          backgroundColor: AppColors.primaryColor,
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 14.h,
                          ),
                        ),

                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_shopping_cart,
                              color: AppColors.whiteColor,
                            ),
                            SizedBox(width: 15.w),
                            AutoSizeText(
                              'Add To Cart',
                              style: AppStyles.medium18White,
                            ),
                            SizedBox(width: 27.w),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
