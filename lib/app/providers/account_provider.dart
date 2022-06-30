import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../services/error/failure.dart';
import '../../services/usecase/usecase.dart';
import '../usecase/logout_usecase.dart';

class AccountProvider extends ChangeNotifier {
  AccountProvider({required this.logoutUseCase});

  LogoutUseCase logoutUseCase;

  ValueChanged<String>? errorMessage;
  ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false);

  void makeActionsBasedOnError(Failure l) {
    errorMessage?.call(l.message);
  }

  void handleError(Either<Failure, dynamic> either) {
    either.fold((l) {
      makeActionsBasedOnError(l);
    }, (r) => null);
  }

  Future<bool> logout() async {
    isLoadingNotifier.value = true;
    var logoutEither = await logoutUseCase.call(NoParams());

    if (logoutEither.isLeft()) {
      handleError(logoutEither);
      isLoadingNotifier.value = false;
      return false;
    } else {
      isLoadingNotifier.value = false;
      return true;
    }
  }
}
