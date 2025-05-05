import 'package:flutter/material.dart';
import 'package:movies/core/helpers/app_regex.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/features/auth/presentation/pages/register/register_veiw_model.dart';

class RegisterForm extends StatelessWidget {
  final RegisterVeiwModel registerVeiwModel;
  const RegisterForm({super.key, required this.registerVeiwModel});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerVeiwModel.formKey,
      child: Column(
        children: [
          verticalSpace(24),
          TextFormField(
            controller: registerVeiwModel.nameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (name) => AppValidators.validateUserName(name),
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: const InputDecoration(
              hintText: "Name",
              prefixIcon: Icon(
                Icons.co_present_outlined,
                size: 24,
              ),
            ),
          ),
          verticalSpace(24),
          TextFormField(
            controller: registerVeiwModel.emailController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (email) => AppValidators.validateEmail(email),
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(
                Icons.email_outlined,
                size: 24,
              ),
            ),
          ),
          verticalSpace(24),
          ValueListenableBuilder(
            valueListenable: registerVeiwModel.isPasswordVisible,
            builder: (context, value, child) {
              return Column(
                children: [
                  TextFormField(
                    controller: registerVeiwModel.passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (password) =>
                        AppValidators.validatePassword(password),
                    obscureText:
                        registerVeiwModel.isPasswordVisible.value == false
                            ? true
                            : false,
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          registerVeiwModel.isPasswordVisible.value == false
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 24,
                        ),
                        onPressed: () =>
                            registerVeiwModel.changePasswordVisibility(),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        size: 24,
                      ),
                    ),
                  ),
                  verticalSpace(24),
                  TextFormField(
                    controller: registerVeiwModel.confirmPasswordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (password) =>
                        AppValidators.validateConfirmPassword(password,
                            registerVeiwModel.passwordController.text),
                    obscureText:
                        registerVeiwModel.isPasswordVisible.value == false
                            ? true
                            : false,
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        size: 24,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          registerVeiwModel.isPasswordVisible.value == false
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 24,
                        ),
                        onPressed: () =>
                            registerVeiwModel.changePasswordVisibility(),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          verticalSpace(24),
          TextFormField(
            controller: registerVeiwModel.phoneController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (phone) => AppValidators.validatePhoneNumber(phone),
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              hintText: "Phone",
              prefixIcon: Icon(
                Icons.phone_sharp,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
