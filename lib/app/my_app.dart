import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ropstam_task/features/home/presentation/pages/home_page.dart';

import '../features/login/presentation/pages/login_page.dart';
import '../features/splash/presentation/pages/splash_page.dart';
import '../utils/constants/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) {
        return MaterialApp(
          title: 'Ropstam Task',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme,
          routes: {
            LoginPage.routeName: (ctx) => const LoginPage(),
            SplashPage.routeName: (ctx) => const SplashPage(),
            HomePage.routeName: (ctx) => const HomePage(),
          },
          home: const SplashPage(),
        );
      },
    );
  }
}
