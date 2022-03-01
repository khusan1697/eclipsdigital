import 'package:equatable/equatable.dart';

class Albums extends Equatable {
  final int userId;
  final int id;
  final String title;

  const Albums(
    this.userId,
    this.id,
    this.title,
  );

  Albums.fromJson(Map<String, dynamic> json)
      : userId = json["userId"] ?? 0,
        id = json['id'] ?? 0,
        title = json["title"] ?? "";

  @override
  List<Object?> get props => [userId, id, title];

  static const empty = Albums(0, 0, "");
}
