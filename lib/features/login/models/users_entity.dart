import 'package:equatable/equatable.dart';

class UsersEntity extends Equatable {
  const UsersEntity({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.mobile,
    required this.mobileVerifiedAt,
    this.apiToken,
    required this.image,
    required this.address,
    required this.country,
    required this.state,
    required this.role,
    required this.verified,
    required this.lang,
    required this.ltd,
    required this.deviceToken,
    required this.gender,
    this.type,
    this.customerId,
    this.provider,
    this.addedBy,
    required this.rating,
    required this.ratingCount,
    this.rememberToken,
  });
  final int id;
  final String username;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String mobile;
  final bool mobileVerifiedAt;
  final String? apiToken;
  final String image;
  final String address;
  final String country;
  final String state;
  final String role;
  final int verified;
  final String lang;
  final String ltd;
  final String deviceToken;
  final int gender;
  final String? type;
  final String? customerId;
  final String? provider;
  final String? addedBy;
  final String rating;
  final int ratingCount;
  final String? rememberToken;

  factory UsersEntity.fromJson(Map<String, dynamic> json) {
    return UsersEntity(
      id: json['id'],
      username: json['username'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      mobile: json['mobile'],
      mobileVerifiedAt: json['mobile_verified_at'],
      apiToken: json['api_token'],
      image: json['image'],
      address: json['address'],
      country: json['country'],
      state: json['state'],
      role: json['role'],
      verified: json['verified'],
      lang: json['lang'],
      ltd: json['ltd'],
      deviceToken: json['device_token'],
      gender: json['gender'],
      type: json['type'],
      customerId: json['customer_id'],
      provider: json['provider'],
      addedBy: json['added_by'],
      rating: json['rating'],
      ratingCount: json['rating count'],
      rememberToken: json['remember_token'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['mobile'] = mobile;
    data['mobile_verified_at'] = mobileVerifiedAt;
    data['api_token'] = apiToken;
    data['image'] = image;
    data['address'] = address;
    data['country'] = country;
    data['state'] = state;
    data['role'] = role;
    data['verified'] = verified;
    data['lang'] = lang;
    data['ltd'] = ltd;
    data['device_token'] = deviceToken;
    data['gender'] = gender;
    data['type'] = type;
    data['customer_id'] = customerId;
    data['provider'] = provider;
    data['added_by'] = addedBy;
    data['rating'] = rating;
    data['rating count'] = ratingCount;
    data['remember_token'] = rememberToken;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        username,
        name,
        email,
        emailVerifiedAt,
        mobile,
        mobileVerifiedAt,
        apiToken,
        image,
        address,
        country,
        state,
        role,
        verified,
        lang,
        ltd,
        deviceToken,
        gender,
        type,
        customerId,
        provider,
        addedBy,
        rating,
        ratingCount,
        rememberToken,
      ];
}
