import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_theme/app_colors.dart';
import 'package:movies/core/constants/app_images.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/routes/routes.dart';
import 'package:movies/features/auth/presentation/pages/login/login_states.dart';
import 'package:movies/features/auth/presentation/pages/login/login_veiw_model.dart';
import 'package:movies/features/auth/presentation/pages/login/widgets/dont_you_have_account_text.dart';
import 'package:movies/features/auth/presentation/pages/login/widgets/login_form.dart';
import 'package:movies/features/auth/presentation/pages/login/widgets/login_with_google_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginVeiwModel>(),
      child: const _LoginPageContent(),
    );
  }
}

class _LoginPageContent extends StatelessWidget {
  const _LoginPageContent();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<LoginVeiwModel>();

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: BlocConsumer<LoginVeiwModel, LoginState>(
          listener: (context, state) {
            state.whenOrNull(
              loading: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.yellow,
                      ),
                    );
                  },
                );
              },
              success: (data) {
                Navigator.pushReplacementNamed(context, Routes.layout);
              },
              error: (error) {
                Navigator.of(context).pop();
                _showErrorDialog(context, error);
              },
            );
          },
          builder: (context, state) {
            return Stack(
              children: [
                ListView(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: Column(
                        children: [
                          Image.asset(AppImages.logo),
                          LoginForm(loginVeiwModel: viewModel),
                          verticalSpace(23),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                child: Text(
                                  "Forget Password ?",
                                  style: TextStyle(
                                    color: AppColors.yellow,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(30),
                          ElevatedButton(
                            onPressed: () => _validateAndLogin(context),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          verticalSpace(20),
                          const DontYouHaveAccountText(),
                          verticalSpace(20),
                          const LoginWithGoogleButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _validateAndLogin(BuildContext context) {
    final viewModel = context.read<LoginVeiwModel>();
    if (viewModel.formKey.currentState!.validate()) {
      viewModel.doLogin();
    }
  }

  void _showErrorDialog(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(
          error,
          style: TextStyle(fontSize: 16.sp, color: AppColors.black),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Got it',
              style: TextStyle(color: AppColors.yellow, fontSize: 16.sp),
            ),
          ),
        ],
      ),
    );
  }
}
