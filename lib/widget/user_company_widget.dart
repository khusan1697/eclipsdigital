import 'package:flutter/material.dart';

import '../size_config.dart';

class UserCompanyWidget extends StatelessWidget {
  final String text1, text2;

  const UserCompanyWidget({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(10),
        vertical: getProportionateScreenHeight(10),
      ),
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(15)),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$text1 :  ",
              style: TextStyle(
                color: const Color(0xff979797),
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(13),
              ),
            ),
            const Divider(color: Colors.white, height: 5),
            Expanded(
              child: Text(
                text2,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(13),
                ),
              ),
            ),
            const Divider(color: Colors.white, height: 5),
          ],
        ),
      ),
    );
  }
}
