import 'package:eclipsdigital/model/address.dart';

class AddressResponse {
  final List<Address> addressList;
  final String error;

  AddressResponse(this.addressList, this.error);

  AddressResponse.fromJson(Map<String, dynamic> json)
      : addressList =
            (json["address"] as List).map((e) => Address.fromJson(e)).toList(),
        error = "";

  AddressResponse.withError(String errorValue)
      : addressList = [],
        error = errorValue;
}
