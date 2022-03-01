import 'package:eclipsdigital/model/geo.dart';

class GeoResponse {
  final List<Geo> geoList;
  final String error;

  GeoResponse(
    this.geoList,
    this.error,
  );

  GeoResponse.fromJson(Map<String, dynamic> json)
      : geoList = (json["geo"] as List).map((e) => Geo.fromJson(e)).toList(),
        error = "";

  GeoResponse.withError(String errorValue)
      : geoList = [],
        error = errorValue;
}
