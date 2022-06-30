import 'package:dartz/dartz.dart';

import '../../../services/error/failure.dart';
import '../../../services/repository/repository.dart';
import '../../../services/usecase/usecase.dart';
import '../models/users_entity.dart';

class SaveSessionUserUsecase implements UseCase<bool, UsersEntity> {
  Repository repository;

  SaveSessionUserUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(UsersEntity params) async {
    return await repository.saveSessionUser(params);
  }
}
