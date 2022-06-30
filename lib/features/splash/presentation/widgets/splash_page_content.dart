import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ropstam_task/features/home/presentation/pages/home_page.dart';
import 'package:ropstam_task/features/login/presentation/pages/login_page.dart';
import 'package:ropstam_task/utils/constants/app_assets.dart';
import 'package:ropstam_task/utils/extension/extensions.dart';

import '../manager/splash_page_view_model.dart';

class SplashPageContent extends StatefulWidget {
  const SplashPageContent({Key? key}) : super(key: key);

  @override
  SplashPageContentState createState() => SplashPageContentState();
}

class SplashPageContentState extends State<SplashPageContent> {
  @override
  void initState() {
    context.read<SplashPageViewModel>().onErrorMessage = (value) => context.show(message: value);
    context.read<SplashPageViewModel>().getSessionUserData().then((value) {
      if (value) {
        Navigator.of(context).pushNamedAndRemoveUntil(HomePage.routeName, (route) => false);
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(LoginPage.routeName, (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Image.asset(AppAssets.logo),
      ),
    );
  }
}
