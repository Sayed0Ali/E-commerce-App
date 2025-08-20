import 'package:e_commerce/core/cache/shared_preferance_utils.dart';
import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/core/utils/validators.dart';
import 'package:e_commerce/feature/ui/auth/login/cubit/login_states.dart';
import 'package:e_commerce/feature/ui/auth/login/cubit/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routs.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../di/di.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginViewModel viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context: context, message: ' waiting...');
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: state.failure.message,
            posActionName: 'ok',
            title: 'Error',
          );
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: 'Login Success',
            posActionName: 'ok',
            title: 'success',
          );
          SharedPreferenceUtils.saveData(
            key: 'name',
            value: state.loginResponseEntity.user!.name,
          );
          SharedPreferenceUtils.saveData(
            key: 'email',
            value: state.loginResponseEntity.user!.email,
          );

          SharedPreferenceUtils.saveData(
            key: 'token',
            value: state.loginResponseEntity.token,
          );
          Navigator.pushNamedAndRemoveUntil(context, AppRoutes.homeRoute, (route) => false,);
        }
      },
      child: Scaffold(

        backgroundColor: AppColors.primaryColor,

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100.h),
                Text('Welcome Back To Store', style: AppStyles.semi24White),
                SizedBox(
                  height: 10.h,
                ), // Using ScreenUtil for responsive height
                Text(
                  'Please sign in with your mail',
                  style: AppStyles.light16White,
                ),
                SizedBox(height: 20.h),
                Text('Email', style: AppStyles.medium18White),
                SizedBox(height: 10.h),
                CustomTextField(
                  hintText: 'Enter your email',
                  style: AppStyles.light18HintText,
                  keyBoardType: TextInputType.text,
                  controller: viewModel.mailController,
                  filledColor: AppColors.whiteColor,
                  validator: AppValidators.validateEmail,
                  hintStyle: AppStyles.light18HintText,
                ),
                SizedBox(height: 20.h),
                Text('Password', style: AppStyles.medium18White),
                SizedBox(height: 10.h),
                CustomTextField(
                  hintText: 'Enter your password',
                  style: AppStyles.light18HintText,
                  keyBoardType: TextInputType.text,
                  controller: viewModel.passwordController,
                  validator: AppValidators.validatePassword,
                  filledColor: AppColors.whiteColor,
                ),
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: AppStyles.regular18White,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                CustomElevatedButton(
                  text: 'Login',
                  textStyle: AppStyles.semi20Primary,
                  onButtonClicked: viewModel.login,
                ),
                SizedBox(height: 20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Don't have an account?",

                      style: AppStyles.medium18White,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, AppRoutes.registerRoute);
                      },
                      child: Text(
                        "Create Account...",
                        style: AppStyles.medium18White.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
