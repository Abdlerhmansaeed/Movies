import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_theme/app_colors.dart';
import 'package:movies/core/routes/routes.dart';
import 'package:movies/features/auth/presentation/pages/login/login_states.dart';
import 'package:movies/features/auth/presentation/pages/login/login_veiw_model.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginVeiwModel, LoginState>(
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
        return child;
      },
    );
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
