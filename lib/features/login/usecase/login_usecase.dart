import 'package:dartz/dartz.dart';
import 'package:ropstam_task/features/login/models/login_params.dart';
import 'package:ropstam_task/features/login/models/login_response.dart';

import '../../../services/error/failure.dart';
import '../../../services/repository/repository.dart';
import '../../../services/usecase/usecase.dart';

class LoginUsecase implements UseCase<LoginResponseModel, LoginParams> {
  Repository repository;

  LoginUsecase(this.repository);

  @override
  Future<Either<Failure, LoginResponseModel>> call(LoginParams params) async {
    return await repository.login(params);
  }
}
