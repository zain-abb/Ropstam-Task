import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ropstam_task/app/usecase/logout_usecase.dart';
import 'package:ropstam_task/features/home/presentation/manager/home_view_model.dart';
import 'package:ropstam_task/features/home/usecases/get_posts_usecase.dart';
import 'package:ropstam_task/features/login/usecase/save_session_user_usecase.dart';
import 'package:ropstam_task/features/splash/usecase/get_session_user_usecase.dart';
import 'package:ropstam_task/utils/data_source/remote_data_source.dart';

import '../../app/globals.dart';
import '../../app/providers/account_provider.dart';
import '../../features/login/presentation/manager/login_view_model.dart';
import '../../features/login/usecase/login_usecase.dart';
import '../../features/splash/presentation/manager/splash_page_view_model.dart';
import '../../services/repository/repository.dart';
import '../../services/repository/repository_imp.dart';
import '../data_source/local_data_source.dart';
import '../network/network_info.dart';

Future<void> init() async {
  /// Usecases
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => SaveSessionUserUsecase(sl()));
  sl.registerLazySingleton(() => GetSessionUserUsecase(sl()));
  sl.registerLazySingleton(() => GetPostsUsecase(sl()));

  /// Configs
  sl.registerLazySingleton(() => AccountProvider(logoutUseCase: sl()));

  /// Data Sources
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImp(flutterSecureStorage: sl()));
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImp(dio: sl()));

  /// Repository
  sl.registerLazySingleton<Repository>(() => RepositoryImp(localDataSource: sl(), remoteDataSource: sl(), networkInfo: sl()));

  /// External
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());

  /// Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// View Models
  sl.registerLazySingleton(() => LoginViewModel(sl(), sl()));
  sl.registerLazySingleton(() => SplashPageViewModel(getSessionUserUsecase: sl()));
  sl.registerLazySingleton(() => HomeViewModel(sl()));
}
