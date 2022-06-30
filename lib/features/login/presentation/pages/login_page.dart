import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/globals.dart';
import '../manager/login_view_model.dart';
import '../widgets/login_page_content.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routeName = 'login-page';

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginViewModel _loginViewModel = sl();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: ChangeNotifierProvider.value(value: _loginViewModel, builder: (context, _) => const LoginPageContent()),
        ),
      ),
    );
  }
}
