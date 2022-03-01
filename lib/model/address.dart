import 'package:eclipsdigital/model/geo.dart';
import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  const Address(this.street, this.suite, this.city, this.zipcode);

  Address.fromJson(Map<String, dynamic> json)
      : street = json["street"] ?? "",
        suite = json["suite"] ?? "",
        city = json['city'] ?? "",
        zipcode = json["zipcode"] ?? "";

  @override
  List<Object?> get props => [street, suite, city, zipcode];

  static const empty = Address("", "", "", "");
}
