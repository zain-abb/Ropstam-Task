import 'package:dartz/dartz.dart';

import '../../../services/error/failure.dart';
import '../../../services/repository/repository.dart';
import '../../../services/usecase/usecase.dart';
import '../models/post_response_model.dart';

class GetPostsUsecase implements UseCase<List<PostResponseModel>, NoParams> {
  Repository repository;

  GetPostsUsecase(this.repository);

  @override
  Future<Either<Failure, List<PostResponseModel>>> call(NoParams params) async {
    return await repository.getPosts(params);
  }
}
