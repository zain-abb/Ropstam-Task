import 'package:dartz/dartz.dart';
import 'package:ropstam_task/features/home/models/post_response_model.dart';
import 'package:ropstam_task/features/login/models/login_params.dart';
import 'package:ropstam_task/features/login/models/login_response.dart';

import '../../features/login/models/users_entity.dart';
import '../error/failure.dart';
import '../usecase/usecase.dart';

abstract class Repository {
  /// This method login the user and return the user info
  /// [Input] : [LoginParams] contains the user info
  /// [Output] : if operation successful returns [UsersEntity] returns the user info
  /// if unsuccessful the response will be [Failure]
  Future<Either<Failure, LoginResponseModel>> login(LoginParams params);

  /// This method gets the saved user info
  /// [Input] : [NoParams] no params for getting the user data
  /// [Output] : if operation successful returns [UsersEntity] returns the user info
  /// if unsuccessful the response will be [Failure]
  Future<Either<Failure, UsersEntity>> getSessionUser(NoParams params);

  /// This method saves the user info for later use
  /// [Input] : [UsersEntity] contains the user info
  /// [Output] : if operation successful returns [bool]
  /// if unsuccessful the response will be [Failure]
  Future<Either<Failure, bool>> saveSessionUser(UsersEntity params);

  /// This method logs out the user and remove the cache info of user
  /// [Input] : [NoParams] gets noParams for the input
  /// [Output] : if operation successful returns [bool] returns true
  /// if unsuccessful the response will be [Failure]
  Future<Either<Failure, bool>> logout(NoParams params);

  /// This method gets the posts
  /// [Input] : [NoParams] gets no params
  /// [Output] : if operation successful returns [List<PostResponseModel>] returns the list of posts
  /// if unsuccessful the response will be [Failure]
  Future<Either<Failure, List<PostResponseModel>>> getPosts(NoParams params);
}
