import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_theme/app_theme.dart';
import 'package:movies/core/bloc_obsriver/app_bloc_obsriver.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/core/routes/app_router.dart';
import 'package:movies/core/routes/routes.dart';
import 'package:movies/features/layout/app_manger/app_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = AppBlocObserver();
  runApp(BlocProvider(
      create: (context) => getIt<AppCubit>(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.appTheme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: generateRoute,
          initialRoute: Routes.splash,
        );
      },
    );
  }
}
