import 'package:e_commerce/domain/entites/login_response_entity.dart';

import '../../../../../domain/failures.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  LoginResponseEntity loginResponseEntity;
  LoginSuccessState({required this.loginResponseEntity});
}

class LoginErrorState extends LoginStates {
  Failure failure;
  LoginErrorState({required this.failure});
}
