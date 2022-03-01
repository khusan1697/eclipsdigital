import 'package:equatable/equatable.dart';

class Photos extends Equatable {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photos(
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  );

  Photos.fromJson(Map<String, dynamic> json)
      : albumId = json["albumId"] ?? 0,
        id = json["id"],
        title = json["title"],
        url = json['url'],
        thumbnailUrl = json["thumbnailUrl"];

  @override
  List<Object?> get props => [albumId, id, title, url, thumbnailUrl];

  static const empty = Photos(0, 0, "", "", "");
}
