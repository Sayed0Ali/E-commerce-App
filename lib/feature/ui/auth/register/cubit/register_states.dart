import 'package:e_commerce/domain/entites/register_response_entity.dart';

import '../../../../../domain/failures.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  RegisterResponseEntity registerResponseEntity;
  RegisterSuccessState({required this.registerResponseEntity});
}

class RegisterErrorState extends RegisterStates {
  Failure failure;
  RegisterErrorState({required this.failure});
}
