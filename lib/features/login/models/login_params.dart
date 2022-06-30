import 'package:equatable/equatable.dart';

class LoginParams extends Equatable {
  const LoginParams({
    required this.email,
    required this.password,
    required this.deviceToken,
  });
  final String email;
  final String password;
  final String deviceToken;

  factory LoginParams.fromJson(Map<String, dynamic> json) {
    return LoginParams(
      email: json['email'],
      password: json['password'],
      deviceToken: json['device_token'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['device_token'] = deviceToken;
    return data;
  }

  @override
  List<Object?> get props => [email, password, deviceToken];
}
