import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/constants/app_images.dart';
import 'package:movies/core/routes/routes.dart';
import 'package:movies/features/layout/app_manger/app_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<AppCubit>().getuserToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BounceIn(
            animate: true,
            duration: const Duration(seconds: 3),
            onFinish: (direction) {
              if (context.read<AppCubit>().state.userToken.isNotEmpty) {
                Navigator.of(context).pushReplacementNamed(Routes.layout);
              } else {
                Navigator.of(context).pushReplacementNamed(Routes.login);
              }
            },
            child: Image.asset(AppImages.logo)),
      ),
    );
  }
}
