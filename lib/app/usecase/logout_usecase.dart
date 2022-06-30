import 'package:dartz/dartz.dart';

import '../../services/error/failure.dart';
import '../../services/repository/repository.dart';
import '../../services/usecase/usecase.dart';

class LogoutUseCase implements UseCase<bool, NoParams> {
  Repository repository;

  LogoutUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.logout(params);
  }
}
