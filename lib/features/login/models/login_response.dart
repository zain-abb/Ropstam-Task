import 'package:ropstam_task/features/login/models/users_entity.dart';

class LoginResponseModel {
  LoginResponseModel({
    required this.accessToken,
    required this.user,
  });
  late final String accessToken;
  late final UsersEntity user;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    user = UsersEntity.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['user'] = user.toJson();
    return data;
  }
}
