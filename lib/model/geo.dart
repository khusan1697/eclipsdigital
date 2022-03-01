import 'package:equatable/equatable.dart';

class Geo extends Equatable {
  final double lat;
  final double lng;

  const Geo(
    this.lat,
    this.lng,
  );

  Geo.fromJson(Map<String, dynamic> json)
      : lat = json["lat"] ?? 0,
        lng = json["lng"] ?? 0;

  @override
  List<Object?> get props => [lat, lng];

  static const empty = Geo(0, 0);
}
