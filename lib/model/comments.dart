import 'package:equatable/equatable.dart';

class Comments extends Equatable {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  const Comments(
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  );

  Comments.fromJson(Map<String, dynamic> json)
      : postId = json['postId'] ?? 0,
        id = json["id"] ?? 0,
        name = json["name"] ?? "",
        email = json["email"] ?? "",
        body = json["body"] ?? "";

  @override
  List<Object?> get props => [postId, id, name, email, body];

  static const empty = Comments(0, 0, "", "", "");
}
