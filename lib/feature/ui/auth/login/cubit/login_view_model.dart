import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/use_cases/register_use_case.dart';
import 'package:e_commerce/feature/ui/auth/login/cubit/login_states.dart';
import 'package:e_commerce/feature/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/use_cases/login_use_case.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;
  LoginViewModel({required this.loginUseCase}) : super(LoginInitialState());
  //todo: hold data - handle logic

  TextEditingController mailController = TextEditingController(
    text: 'ahmedmutss114012@gmail.com',
  );
  TextEditingController passwordController = TextEditingController(
    text: 'Ahmedss123',
  );

  var formKey = GlobalKey<FormState>();

  void login() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginLoadingState());
      var either = await loginUseCase.invoke(
        mailController.text,
        passwordController.text,
      );
      either.fold(
        (error) {
          emit(LoginErrorState(failure: error));
        },
        (response) {
          emit(LoginSuccessState(loginResponseEntity: response));
        },
      );
    }
  }
}
