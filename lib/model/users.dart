import 'package:eclipsdigital/model/address.dart';
import 'package:eclipsdigital/model/company.dart';
import 'package:eclipsdigital/model/geo.dart';
import 'package:equatable/equatable.dart';

class Users extends Equatable {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  const Users(
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  );

  Users.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? 0,
        name = json['name'] ?? "",
        username = json["username"] ?? "",
        email = json["email"] ?? "",
        address = json["address"] != null
            ? Address.fromJson(json['address'])
            : Address.empty,
        phone = json["phone"] ?? "",
        website = json["website"] ?? 0,
        company = json['company'] != null
            ? Company.fromJson(json["company"])
            : Company.empty;

  @override
  List<Object?> get props =>
      [id, name, username, email, address, phone, website, company];

  static const empty =
      Users(0, "", "", "", Address.empty, "", "", Company.empty);
}
