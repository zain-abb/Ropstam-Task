import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ropstam_task/utils/constants/app_assets.dart';
import 'package:ropstam_task/utils/extension/extensions.dart';

import '../../../../customs/continue_button.dart';
import '../../../../customs/custom_form_field.dart';
import '../../../../utils/validators/form_field_validation.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../manager/login_view_model.dart';

class LoginPageContent extends StatefulWidget {
  const LoginPageContent({Key? key}) : super(key: key);

  @override
  LoginPageContentState createState() => LoginPageContentState();
}

class LoginPageContentState extends State<LoginPageContent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<LoginViewModel>().onErrorMessage = (value) => context.show(message: value);
    context.read<LoginViewModel>().resetFields();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Theme.of(context).primaryColor.withOpacity(0.3),
          ],
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.all(22.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 44.h),
                  Text('Hello Again!', style: Theme.of(context).textTheme.headline4?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8.h),
                  Text('Chance to get your\nlife batter', style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center),
                  SizedBox(height: 44.h),
                  CustomTextFormField(
                    hintText: context.read<LoginViewModel>().userNameHintText,
                    labelText: context.read<LoginViewModel>().userNameLabelText,
                    isLabelEnabled: false,
                    controller: context.read<LoginViewModel>().userNameController,
                    focusNode: context.read<LoginViewModel>().userNameFocusNode,
                    validator: FormFieldValidators.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(context.read<LoginViewModel>().passwordFocusNode);
                    },
                  ),
                  SizedBox(height: 22.h),
                  ValueListenableBuilder<bool>(
                    valueListenable: context.read<LoginViewModel>().obsecureTextNotifier,
                    builder: (_, value, __) => CustomTextFormField(
                      obscureText: value,
                      maxLines: 1,
                      isLabelEnabled: false,
                      controller: context.read<LoginViewModel>().passwordController,
                      labelText: context.read<LoginViewModel>().passwordLabelText,
                      hintText: context.read<LoginViewModel>().passwordHintText,
                      keyboardType: TextInputType.text,
                      focusNode: context.read<LoginViewModel>().passwordFocusNode,
                      validator: FormFieldValidators.validatePassword,
                      showSuffixIcon: true,
                      onSuffixIconClick: context.read<LoginViewModel>().changeObsecureText,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: () {}, child: Text('Recovery Password', style: Theme.of(context).textTheme.subtitle1)),
                  ),
                  SizedBox(height: 34.h),
                  ContinueButton(
                    text: 'Login',
                    loadingNotifier: context.read<LoginViewModel>().isLoadingNotifier,
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      await context.read<LoginViewModel>().loginUser();
                      if (context.read<LoginViewModel>().usersEntity != null) {
                        Navigator.of(context).pushNamedAndRemoveUntil(HomePage.routeName, (route) => false);
                      }
                    },
                  ),
                  SizedBox(height: 16.h),
                  TextButton(onPressed: () {}, child: Text('or continue with', style: Theme.of(context).textTheme.subtitle1)),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _socialLogins(AppAssets.googleSVG),
                      _socialLogins(AppAssets.appleSVG),
                      _socialLogins(AppAssets.facebookSVG),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialLogins(String svgPath) {
    return Container(
      padding: EdgeInsets.all(5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(color: Colors.white),
        color: Colors.transparent,
      ),
      child: SvgPicture.asset(svgPath, width: 32.w, height: 32.w),
    );
  }
}
