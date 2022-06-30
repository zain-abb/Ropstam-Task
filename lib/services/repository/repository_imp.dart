import 'package:dartz/dartz.dart';
import 'package:ropstam_task/features/home/models/post_response_model.dart';
import 'package:ropstam_task/features/login/models/login_response.dart';

import '../../features/login/models/login_params.dart';
import '../../features/login/models/users_entity.dart';
import '../../utils/constants/app_messages.dart';
import '../../utils/data_source/local_data_source.dart';
import '../../utils/data_source/remote_data_source.dart';
import '../../utils/network/network_info.dart';
import '../error/failure.dart';
import '../usecase/usecase.dart';
import 'repository.dart';

class RepositoryImp extends Repository {
  LocalDataSource localDataSource;
  RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RepositoryImp({required this.localDataSource, required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, LoginResponseModel>> login(LoginParams params) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(AppMessages.noInternet));
    }
    try {
      return Right(await remoteDataSource.login(params));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UsersEntity>> getSessionUser(NoParams params) async {
    try {
      return Right(await localDataSource.getSessionUser());
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> saveSessionUser(UsersEntity params) async {
    try {
      return Right(await localDataSource.saveSessionUser(params));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> logout(NoParams params) async {
    try {
      return Right(await localDataSource.logout(params));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostResponseModel>>> getPosts(NoParams params) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(AppMessages.noInternet));
    }
    try {
      return Right(await remoteDataSource.getPosts(params));
    } catch (e) {
    return Left(ServerFailure(e.toString()));
    }
  }
}
