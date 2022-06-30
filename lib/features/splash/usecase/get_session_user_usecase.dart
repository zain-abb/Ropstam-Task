import 'package:dartz/dartz.dart';

import '../../../services/error/failure.dart';
import '../../../services/repository/repository.dart';
import '../../../services/usecase/usecase.dart';
import '../../login/models/users_entity.dart';

class GetSessionUserUsecase implements UseCase<UsersEntity, NoParams> {
  Repository repository;

  GetSessionUserUsecase(this.repository);

  @override
  Future<Either<Failure, UsersEntity>> call(NoParams params) async {
    return await repository.getSessionUser(params);
  }
}
