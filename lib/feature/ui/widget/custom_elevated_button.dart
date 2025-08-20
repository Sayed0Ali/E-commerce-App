import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  Color? backGroundColor;
  String text;
  TextStyle? textStyle;
  void Function()? onButtonClicked;
  CustomElevatedButton({
    super.key,
    this.backGroundColor,
    required this.text,
    this.textStyle,
    required this.onButtonClicked,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backGroundColor ?? AppColors.whiteColor,
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
          side: BorderSide(color: AppColors.whiteColor, width: 2),
        ),
      ),
      onPressed: onButtonClicked,
      child: SizedBox(
        height: 64.h,
        width: 398.w,
        child: Center(child: AutoSizeText(text, style: textStyle)),
      ),
    );
  }
}
