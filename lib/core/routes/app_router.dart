import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/core/routes/routes.dart';
import 'package:movies/features/auth/presentation/pages/login/login_page.dart';
import 'package:movies/features/auth/presentation/pages/register/register_screen.dart';
import 'package:movies/features/auth/presentation/pages/register/register_veiw_model.dart';
import 'package:movies/features/layout/app_manger/app_cubit.dart';
import 'package:movies/features/layout/pages/app_layout.dart';
import 'package:movies/onBoarding/Welcome_page.dart';
import 'package:movies/onBoarding/splash_screen.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  print(settings.name);
  switch (settings.name) {
    case Routes.splash:
      return MaterialPageRoute(
        builder: (_) => const SplashScreen(),
      );
    case Routes.welcomePage:
      return MaterialPageRoute(
        builder: (_) => const WelcomePage(),
      );
    case Routes.login:
      return MaterialPageRoute(
        builder: (_) => const LoginPage(),
      );
    case Routes.register:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
            create: (context) => getIt<RegisterVeiwModel>(),
            child: const RegisterScreen()),
      );
    case Routes.layout:
      return MaterialPageRoute(
        builder: (context) => AppLayout(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
