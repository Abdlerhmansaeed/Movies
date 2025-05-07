import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_theme/app_colors.dart';
import 'package:movies/core/constants/app_images.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/routes/routes.dart';
import 'package:movies/features/auth/presentation/pages/register/register_states.dart';
import 'package:movies/features/auth/presentation/pages/register/register_veiw_model.dart';
import 'package:movies/features/auth/presentation/pages/register/widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: const Text(
          "Register",
          style: TextStyle(color: AppColors.yellow),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.yellow),
      ),
      body: BlocListener<RegisterVeiwModel, RegisterStates>(
        bloc: context.read<RegisterVeiwModel>(),
        listener: (context, state) => state.whenOrNull(
          success: (data) => Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.layout,
            (route) => false,
          ),
          loading: () => showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.yellow,
                ),
              );
            },
          ),
          error: (error) => _showErrorDialog(context, error),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: ListView(
            children: [
              Image.asset(AppImages.signUpAvatar),
              RegisterForm(
                registerVeiwModel: context.read<RegisterVeiwModel>(),
              ),
              verticalSpace(24),
              ElevatedButton(
                onPressed: () => _validateAndRegister(context),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _validateAndRegister(BuildContext context) {
  final viewModel = context.read<RegisterVeiwModel>();
  if (viewModel.formKey.currentState!.validate()) {
    viewModel.doRegister();
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
