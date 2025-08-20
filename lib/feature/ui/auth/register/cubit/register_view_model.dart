import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/use_cases/register_use_case.dart';
import 'package:e_commerce/feature/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/cache/shared_preferance_utils.dart';
@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;
  RegisterViewModel({required this.registerUseCase})
    : super(RegisterInitialState());
  //todo: hold data - handle logic

  TextEditingController nameController = TextEditingController(text: 'seka');
  TextEditingController phoneController = TextEditingController(text: '01004324336');
  TextEditingController mailController = TextEditingController(text:'Ahmed@gmail.com');
  TextEditingController passwordController = TextEditingController(text: 'smssss2222222');
  TextEditingController rePasswordController = TextEditingController(text: 'smssss2222222');

  var formKey = GlobalKey<FormState>();

  void register() async {
    if(formKey.currentState?.validate()==true){
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
      nameController.text,
      mailController.text,
      passwordController.text,
      rePasswordController.text,
      phoneController.text,
    );

    either.fold((error){
      emit(RegisterErrorState(failure: error));
    }, (response){emit(RegisterSuccessState(registerResponseEntity: response));});
  }
}}
