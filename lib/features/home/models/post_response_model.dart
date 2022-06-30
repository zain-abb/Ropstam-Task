import 'package:equatable/equatable.dart';

class PostResponseModel extends Equatable {
  const PostResponseModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
  final int userId;
  final int id;
  final String title;
  final String body;

  factory PostResponseModel.fromJson(Map<String, dynamic> json) {
    return PostResponseModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }

  @override
  List<Object?> get props => [userId, id, title, body];
}
