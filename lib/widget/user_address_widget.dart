import 'package:flutter/material.dart';

import '../size_config.dart';

class UserAddressWidget extends StatelessWidget {
  final String text1, text2;

  const UserAddressWidget({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(10),
      ),
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(10),
        horizontal: getProportionateScreenWidth(20),
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white10, width: 2),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -1),
              color: const Color(0xff979797).withOpacity(0.1),
              blurRadius: 5,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$text1 : ",
            style: TextStyle(
              color: const Color(0xff979797),
              fontSize: getProportionateScreenWidth(15),
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              text2,
              style: TextStyle(
                color: Colors.white,
                fontSize: getProportionateScreenWidth(13),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
