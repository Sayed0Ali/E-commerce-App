import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppThems {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.transparentColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.whiteColor,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
      centerTitle: true,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
    ),
  );

}
