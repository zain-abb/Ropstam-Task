import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ropstam_task/services/error/failure.dart';

import '../../features/home/models/post_response_model.dart';
import '../../features/login/models/login_params.dart';
import '../../features/login/models/login_response.dart';
import '../../services/usecase/usecase.dart';
import '../constants/app_messages.dart';

abstract class RemoteDataSource {
  /// This method calls the login user api
  /// [Input] : [LoginParams] get the user email and password
  /// [Output] : [LoginResponseModel] returns the user info
  /// Else it will throw errors
  Future<LoginResponseModel> login(LoginParams params);

  /// This method gets the posts
  /// [Input] : [NoParams] gets no params
  /// [Output] : if operation successful returns [List<PostResponseModel>] returns the list of posts
  /// if unsuccessful the response will be [Failure]
  Future<List<PostResponseModel>> getPosts(NoParams params);
}

class RemoteDataSourceImp extends RemoteDataSource {
  Dio dio;
  RemoteDataSourceImp({required this.dio});

  @override
  Future<LoginResponseModel> login(LoginParams params) async {
    var url = 'http://buddy.ropstambpo.com/api/login';

    try {
      final response = await dio.post(
        url,
        data: {'email': params.email, 'password': params.password, 'device_token': params.deviceToken},
      );

      if (response.statusCode == 200 && response.data['meta']['status'] == 200) {
        return LoginResponseModel.fromJson(response.data['data']);
      }

      handleLogin(response);
      throw AppMessages.somethingWentWrong;
    } on DioError catch (exception) {
      handleLogin(exception.response);
      if (exception.type == DioErrorType.connectTimeout) {
        throw AppMessages.timeOut;
      } else {
        throw AppMessages.somethingWentWrong;
      }
    }
  }

  void handleLogin(Response<dynamic>? response) {
    if (response?.data == null) {
      throw AppMessages.somethingWentWrong;
    }
    if (response?.data['meta']['status'] == 401) {
      throw response?.data['message'] ?? AppMessages.somethingWentWrong;
    }
    if (response?.data['meta']['status'] == 404) {
      throw response?.data['message'] ?? AppMessages.userNotFound;
    }
  }

  @override
  Future<List<PostResponseModel>> getPosts(NoParams params) async {
    var url = 'https://jsonplaceholder.typicode.com/posts';

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        return List.from(response.data).map((e) => PostResponseModel.fromJson(e)).toList();
      }

      throw AppMessages.somethingWentWrong;
    } on DioError catch (exception) {
      if (exception.type == DioErrorType.connectTimeout) {
        throw AppMessages.timeOut;
      } else {
        throw AppMessages.somethingWentWrong;
      }
    }
  }
}
