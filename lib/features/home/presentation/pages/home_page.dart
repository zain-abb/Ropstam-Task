import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/globals.dart';
import '../manager/home_view_model.dart';
import '../widgets/home_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = 'home-page';

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeViewModel _loginViewModel = sl();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: ChangeNotifierProvider.value(value: _loginViewModel, builder: (context, _) => const HomePageContent()),
        ),
      ),
    );
  }
}
