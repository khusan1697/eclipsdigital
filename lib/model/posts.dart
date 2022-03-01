import 'package:equatable/equatable.dart';

class Posts extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  const Posts(
    this.userId,
    this.id,
    this.title,
    this.body,
  );

  Posts.fromJson(Map<String, dynamic> json)
      : userId = json["userId"] ?? 0,
        id = json["id"] ?? 0,
        title = json["title"] ?? "",
        body = json["body"] ?? "";

  @override
  List<Object?> get props => [userId, id, title, body];

  static const empty = Posts(0, 0, "", "");
}
