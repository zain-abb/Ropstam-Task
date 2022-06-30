import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:ropstam_task/features/login/models/login_params.dart';

import '../../../../services/error/failure.dart';
import '../../models/users_entity.dart';
import '../../usecase/login_usecase.dart';
import '../../usecase/save_session_user_usecase.dart';

class LoginViewModel extends ChangeNotifier {
  LoginUsecase loginUsecase;
  SaveSessionUserUsecase saveSessionUserUsecase;

  LoginViewModel(this.loginUsecase, this.saveSessionUserUsecase);

  ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false);

  ValueNotifier<bool> obsecureTextNotifier = ValueNotifier(true);

  ValueChanged<String>? onErrorMessage;

  UsersEntity? usersEntity;

  final TextEditingController userNameController = TextEditingController();
  final String userNameLabelText = 'User Name';
  final String userNameHintText = 'Enter your username';
  final FocusNode userNameFocusNode = FocusNode();

  final TextEditingController passwordController = TextEditingController();
  final String passwordLabelText = 'Password';
  final String passwordHintText = 'Enter your password';
  final FocusNode passwordFocusNode = FocusNode();

  void handleError(Either<Failure, dynamic> either) {
    isLoadingNotifier.value = false;
    either.fold((l) => onErrorMessage?.call(l.message), (r) => null);
  }

  Future<void> loginUser() async {
    isLoadingNotifier.value = true;
    usersEntity = null;
    var loginEither = await loginUsecase
        .call(LoginParams(email: userNameController.text, password: passwordController.text, deviceToken: 'zasdcvgtghnkiuhgfde345tewasdfghjkm'));

    if (loginEither.isLeft()) {
      handleError(loginEither);
      isLoadingNotifier.value = false;
    } else {
      loginEither.foldRight(null, (r, previous) async {
        usersEntity = r.user;
        await saveSessionUserUsecase.call(r.user);
      });
      isLoadingNotifier.value = false;
    }
  }

  void changeObsecureText() {
    obsecureTextNotifier.value = !obsecureTextNotifier.value;
  }

  void resetFields() {
    passwordController.text = '';
    userNameController.text = '';
  }
}
