import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/constants/shared_pref_keys.dart';
import 'package:movies/core/helpers/shared_pref_helper.dart';
import 'package:movies/core/network/api_resuslt.dart' as apiResult;
import 'package:movies/features/auth/data/models/login_requset/login_requset.dart';
import 'package:movies/features/auth/domain/usecases/login_use_case.dart';
import 'package:movies/features/auth/presentation/pages/login/login_states.dart';

@injectable
class LoginVeiwModel extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  LoginVeiwModel(this._loginUseCase) : super(LoginState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ValueNotifier<bool> isPasswordVisible = ValueNotifier<bool>(false);
  void doLogin() async {
    if (!formKey.currentState!.validate()) return;

    emit(LoginState.loading());

    final response = await _loginUseCase(LoginRequset(
      email: emailController.text.trim(),
      password: passwordController.text,
    ));

    switch (response) {
      case apiResult.ApiSuccess(:final data):
        await saveUserToken(data.data ?? '');
        emit(LoginState.success(data));
        break;

      case apiResult.ApiFailure(:final errorHandler):
        emit(LoginState.error(error: errorHandler.apiErrorModel.message ?? ''));
        break;
    }
  }

  changePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}

Future<void> saveUserToken(String token) async {
  final sharedPrefHelper = SharedPrefHelper();
  await sharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
}
