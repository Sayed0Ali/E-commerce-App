import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final Color? fontColor;
  final String text;
  final double? fontSize;
  final TextStyle? textStyle;
  final FontWeight? fontWeight;

  CustomText({
    required this.text,
    this.fontWeight,
    this.textStyle,
    this.fontColor,
    this.fontSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style:
          textStyle ??
          Theme.of(context).textTheme.titleMedium?.copyWith(
            color: fontColor ?? AppColors.primaryColor,
            fontWeight: fontWeight ?? FontWeight.w500,
            fontSize: 18.sp,
          ),
    );
  }
}
