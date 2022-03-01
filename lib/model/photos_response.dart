import 'package:eclipsdigital/model/photos.dart';

class PhotosResponse {
  final List<Photos> photosList;
  final String error;

  PhotosResponse(this.photosList, this.error);

  PhotosResponse.fromJson(json)
      : photosList = (json as List).map((e) => Photos.fromJson(e)).toList(),
        error = "";

  PhotosResponse.withError(String errorValue)
      : photosList = [],
        error = errorValue;
}
