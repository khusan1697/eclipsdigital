import 'package:eclipsdigital/model/albums.dart';

class AlbumsResponse {
  final List<Albums> albumList;
  final String error;

  AlbumsResponse(this.albumList, this.error);

  AlbumsResponse.fromJson(json)
      : albumList = (json as List).map((e) => Albums.fromJson(e)).toList(),
        error = "";

  AlbumsResponse.withError(String errorValue)
      : albumList = [],
        error = errorValue;
}
