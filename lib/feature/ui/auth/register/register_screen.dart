import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/core/utils/validators.dart';
import 'package:e_commerce/feature/ui/auth/register/cubit/register_states.dart';
import 'package:e_commerce/feature/ui/auth/register/cubit/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routs.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../di/di.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterViewModel viewModel = getIt<RegisterViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context: context, message: "loading...");
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: state.failure.message,
            title: 'Error',
            posActionName: 'Ok',
          );
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: 'Register Successfully',
            title: 'Success',
            posActionName: 'ok',
          );

          Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Form(
            key: viewModel.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100.h),

                  SizedBox(height: 20.h),
                  Text('Full Name', style: AppStyles.medium18White),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    hintText: 'Enter your Full Name',
                    controller: viewModel.nameController,
                    keyBoardType: TextInputType.name,
                    style: AppStyles.light18HintText,
                    filledColor: AppColors.whiteColor,
                    validator: AppValidators.validateFullName,
                  ),
                  SizedBox(height: 20.h),
                  Text('Mobile Number', style: AppStyles.medium18White),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    validator: AppValidators.validatePhoneNumber,
                    hintText: 'Enter your Mobile Number',
                    keyBoardType: TextInputType.text,
                    controller: viewModel.phoneController,
                    style: AppStyles.light18HintText,
                    filledColor: AppColors.whiteColor,
                  ),
                  SizedBox(height: 20.h),
                  Text('E-mail address', style: AppStyles.medium18White),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    hintText: 'Enter your E-mail address',
                    style: AppStyles.light18HintText,
                    filledColor: AppColors.whiteColor,
                    controller: viewModel.mailController,
                    validator: AppValidators.validateEmail,
                    keyBoardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20.h),
                  Text('Password', style: AppStyles.medium18White),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    keyBoardType: TextInputType.visiblePassword,
                    controller: viewModel.passwordController,
                    hintText: 'Enter your password',
                    validator: AppValidators.validatePassword,
                    style: AppStyles.light18HintText,
                    filledColor: AppColors.whiteColor,
                  ),
                  SizedBox(height: 20.h),
                  Text('Re-Password', style: AppStyles.medium18White),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    keyBoardType: TextInputType.visiblePassword,
                    controller: viewModel.rePasswordController,
                    hintText: 'Enter your Re-Password',
                    validator: AppValidators.validatePassword,
                    style: AppStyles.light18HintText,
                    filledColor: AppColors.whiteColor,
                  ),
                  SizedBox(height: 3.h),

                  SizedBox(height: 30.h),
                  CustomElevatedButton(
                    text: 'Sign Up',
                    textStyle: AppStyles.semi20Primary,
                    onButtonClicked: () {
                      viewModel.register();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
