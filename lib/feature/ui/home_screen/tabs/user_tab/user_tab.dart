import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/core/cache/shared_preferance_utils.dart';
import 'package:e_commerce/core/utils/app_routs.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class UserTab extends StatelessWidget {
  const UserTab({super.key});

  @override
  Widget build(BuildContext context) {
    String? name = SharedPreferenceUtils.getData(key: 'name') as String?;
    String? email = SharedPreferenceUtils.getData(key: 'email') as String?;
    String? pass = SharedPreferenceUtils.getData(key: 'password') as String?;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Welcome ${name ?? ""}',
                        style: AppStyles.semi20Primary,
                      ),
                      AutoSizeText(
                        email ?? "",
                        style: AppStyles.light14SearchHint,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      SharedPreferenceUtils.removeData(key: 'token');
                      {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.loginRouten,
                          (route) => false,
                        );
                      }
                    },
                    icon: Icon(
                      Icons.logout_rounded,
                      size: 30.sp,
                      color: AppColors.primaryColor,
                      blendMode:BlendMode.dstOut,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              buildInfoContainer('Your Full Name ', name ?? "n"),
              SizedBox(height: 10.h),
              buildInfoContainer('Your E-mail ', email ?? ""),
              SizedBox(height: 10.h),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoContainer(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Text(label, style: AppStyles.medium18HeadLine),
          SizedBox(height: 6.h),

          // Container
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary30Opacity),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(value, style: AppStyles.medium14PrimaryDark),
                ),
                Icon(Icons.edit_note_sharp, color: AppColors.primaryColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
