import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  final Color? filledColor;
  final Color? borderColor;
  final bool obscureText;
  final String hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? labelStyle;
  final int maxLines;
  final TextStyle? style;
  final TextInputType keyBoardType;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final bool readOnly;

  const CustomTextField({
    super.key,
    this.readOnly = false,
    this.filledColor = AppColors.whiteColor,
    this.onChanged,
    this.keyBoardType = TextInputType.text,
    this.validator,
    this.borderColor = AppColors.whiteColor,
    required this.hintText,
    this.labelText,
    this.controller,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.labelStyle,
    this.style,
    this.obscureText = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      cursorColor: AppColors.blackColor,
      style: style ?? AppStyles.medium14PrimaryDark,
      obscureText: obscureText,
      keyboardType: keyBoardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: filledColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        labelText: labelText,
        labelStyle: labelStyle,
        hintStyle: hintStyle ?? AppStyles.light14SearchHint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.primaryColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.primaryColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.redColor, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.redColor, width: 1),
        ),
      ),
    );
  }
}
