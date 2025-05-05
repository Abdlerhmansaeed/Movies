import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/network/api_resuslt.dart';
import 'package:movies/features/auth/data/models/register_request/register_request.dart';
import 'package:movies/features/auth/domain/usecases/register_use_case.dart';
import 'package:movies/features/auth/presentation/pages/register/register_states.dart';

@injectable
class RegisterVeiwModel extends Cubit<RegisterStates> {
  RegisterVeiwModel(this._registerUseCase) : super(RegisterStates.initial());
  final RegisterUseCase _registerUseCase;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  ValueNotifier<bool> isPasswordVisible = ValueNotifier<bool>(false);

  void doRegister() async {
    emit(RegisterStates.loading());

    var response = await _registerUseCase(
      RegisterRequest(
          avaterId: 1,
          confirmPassword: confirmPasswordController.text,
          email: emailController.text,
          name: nameController.text,
          password: passwordController.text,
          phone: phoneController.text),
    );

    switch (response) {
      case ApiSuccess(:final data):
        emit(RegisterStates.success(data));
        break;
      case ApiFailure(:final errorHandler):
        emit(RegisterStates.error(
            error: errorHandler.apiErrorModel.message ?? ''));
        break;
    }
  }

  void changePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
