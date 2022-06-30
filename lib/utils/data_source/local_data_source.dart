import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ropstam_task/services/error/failure.dart';
import 'package:ropstam_task/utils/constants/app_messages.dart';

import '../../features/login/models/users_entity.dart';
import '../../services/usecase/usecase.dart';

abstract class LocalDataSource {
  /// This method gets the user info from local storage
  /// [Output] : [UsersEntity] gets user info
  Future<UsersEntity> getSessionUser();

  /// This method saves the user information
  /// [Output] : [bool] saves the information to local storage
  Future<bool> saveSessionUser(UsersEntity params);

  /// This method logs out the use
  /// [Output] : [bool] returns true if user logs out
  Future<bool> logout(NoParams params);
}

class LocalDataSourceImp implements LocalDataSource {
  FlutterSecureStorage flutterSecureStorage;

  LocalDataSourceImp({required this.flutterSecureStorage});

  static const sessionUserKey = 'SESSION_USER_KEY';
  static const firstTimeOpenKey = 'FIRST_TIME_OPEN';

  @override
  Future<UsersEntity> getSessionUser() async {
    var value = await flutterSecureStorage.read(key: sessionUserKey);
    return handleSessionUser(value);
  }

  UsersEntity handleSessionUser(String? value) {
    if (value == null) {
      throw const CacheFailure(AppMessages.somethingWentWrong);
    }
    return UsersEntity.fromJson(jsonDecode(value));
  }

  @override
  Future<bool> saveSessionUser(UsersEntity params) async {
    await flutterSecureStorage.write(key: sessionUserKey, value: jsonEncode(params.toJson()));
    return true;
  }

  @override
  Future<bool> logout(NoParams params) async {
    await flutterSecureStorage.delete(key: sessionUserKey);
    return true;
  }
}
