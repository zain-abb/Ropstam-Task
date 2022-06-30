import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../app/globals.dart';
import '../../../../services/error/failure.dart';
import '../../../../services/usecase/usecase.dart';
import '../../../login/presentation/manager/login_view_model.dart';
import '../../usecase/get_session_user_usecase.dart';

class SplashPageViewModel extends ChangeNotifier {
  GetSessionUserUsecase getSessionUserUsecase;

  SplashPageViewModel({required this.getSessionUserUsecase});

  ValueChanged<String>? onErrorMessage;
  ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false);

  LoginViewModel get _loginViewMode => sl();

  void handleError(Either<Failure, dynamic> either) {
    isLoadingNotifier.value = false;
    either.fold((l) => onErrorMessage?.call(l.message), (r) => null);
  }

  Future<bool> getSessionUserData() async {
    isLoadingNotifier.value = true;
    var modelEither = await getSessionUserUsecase.call(NoParams());
    isLoadingNotifier.value = false;

    if (modelEither.isLeft()) {
      return false;
    } else {
      modelEither.fold((l) => null, (r) async {
        _loginViewMode.usersEntity = r;
      });
      return true;
    }
  }
}
