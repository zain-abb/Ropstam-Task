import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/globals.dart';
import '../manager/splash_page_view_model.dart';
import '../widgets/splash_page_content.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const routeName = 'splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashPageViewModel _splashPageViewModel = sl();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: ChangeNotifierProvider.value(
          value: _splashPageViewModel,
          builder: (context, snapshot) {
            return const SplashPageContent();
          },
        ),
      ),
    );
  }
}
