import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/domain/entites/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce/feature/ui/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:e_commerce/feature/ui/home_screen/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:e_commerce/feature/ui/widget/category_brand_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}


class _HomeTabState extends State<HomeTab> {
  final HomeTabViewModel viewModel = getIt<HomeTabViewModel>();
  @override
  void initState() {
    super.initState();

    viewModel.getAllCategories();
    viewModel.getAllBrands();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: EdgeInsets.symmetric(horizontal: 10.w,),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAnnouncement(
              images: [
                'assets/images/Advertisement1.png',
                'assets/images/Advertisement2.png',
                'assets/images/Advertisement3.png',
              ],
            ),
            SizedBox(height: 24.h),
            _lineBreak(name: 'Category'),
            BlocBuilder<HomeTabViewModel, HomeTabStates>(
              bloc: viewModel,

              builder: (context, state) {
                if (state is CategorySuccessState) {
                  return _buildCategoryBrandSec(
                    list: state.categoryResponseEntity.data!,
                  );
                }

                if (viewModel.categoryList.isNotEmpty) {
                  return _buildCategoryBrandSec(list: viewModel.categoryList);
                }

                if (state is CategoryLoadingState) {
                  return Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
                }
                return const SizedBox.shrink();}
            ),

            _lineBreak(name: 'Brands'),
            BlocBuilder<HomeTabViewModel, HomeTabStates>(
              bloc: viewModel,

              builder: (context, state) {
                if (state is BrandLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  );
                } else if (state is BrandErrorState) {
                  return Text(state.failure.message);
                } else if (state is BrandSuccessState) {
                  return _buildCategoryBrandSec(
                    list: state.categoryResponseEntity.data!,
                  );
                } return const SizedBox.shrink();
              },
            ),
            //_buildCategoryBrandSec(const CategoryBrandItem(item: ,)),
          ],
        ),
      ),
    );
  }

  ImageSlideshow _buildAnnouncement({required List<String> images}) {
    return ImageSlideshow(
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
          images.map((url) {
            return Image.asset(url, fit: BoxFit.cover);
          }).toList(),
    );
  }

  Widget _lineBreak({required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: AppStyles.medium18HeadLine),
        TextButton(
          onPressed: () {
            //todo: navigate to all
          },
          child: Text("View All", style: AppStyles.medium14PrimaryDark),
        ),
      ],
    );
  }

  SizedBox _buildCategoryBrandSec({required List<CategoryOrBrandEntity> list}) {
    return SizedBox(
      height: 250.h,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount:2,
          mainAxisSpacing: 16.h,
          crossAxisSpacing: 16.w,
        ),
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const ScrollPhysics(),

        itemBuilder: (context, index) {
          return CategoryBrandItem(item: list[index]);
        },
      ),
    );
  }
}
