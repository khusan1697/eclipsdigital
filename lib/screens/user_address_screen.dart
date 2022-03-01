import 'package:eclipsdigital/model/address.dart';
import 'package:eclipsdigital/size_config.dart';
import 'package:eclipsdigital/widget/user_address_widget.dart';
import 'package:flutter/material.dart';

class UserAddressScreen extends StatelessWidget {
  final Address address;

  const UserAddressScreen({
    Key? key,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Address"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(25)),
            UserAddressWidget(text1: "Street : ", text2: address.street),
            SizedBox(height: getProportionateScreenHeight(10)),
            UserAddressWidget(text1: "Suite : ", text2: address.suite),
            SizedBox(height: getProportionateScreenHeight(10)),
            UserAddressWidget(text1: "City", text2: address.city),
            SizedBox(height: getProportionateScreenHeight(10)),
            UserAddressWidget(text1: "Zipcode : ", text2: address.zipcode),
          ],
        ),
      ),
    );
  }
}
