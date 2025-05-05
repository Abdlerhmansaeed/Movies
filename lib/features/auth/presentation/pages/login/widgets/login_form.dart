import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/helpers/app_regex.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/features/auth/presentation/pages/login/login_veiw_model.dart';

class LoginForm extends StatelessWidget {
  final LoginVeiwModel loginVeiwModel;
  const LoginForm({super.key, required this.loginVeiwModel});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginVeiwModel.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: context.read<LoginVeiwModel>().emailController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (email) => AppValidators.validateEmail(email),
            keyboardType: TextInputType.emailAddress,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: const InputDecoration(
                hintText: "Email", prefixIcon: Icon(Icons.email_rounded)),
          ),
          verticalSpace(23),
          ValueListenableBuilder<bool>(
            valueListenable: loginVeiwModel.isPasswordVisible,
            builder: (context, isPasswordVisible, child) {
              return TextFormField(
                controller: context.read<LoginVeiwModel>().passwordController,
                obscureText: !isPasswordVisible,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (password) =>
                    AppValidators.validatePassword(password),
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  suffixIcon: IconButton(
                    icon: Icon(isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () => loginVeiwModel.changePasswordVisibility(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
