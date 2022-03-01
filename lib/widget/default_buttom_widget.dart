import 'package:flutter/material.dart';

import '../size_config.dart';

class DefaultButtonWidget extends StatelessWidget {
  final String text;
  final GestureTapCallback press;

  const DefaultButtonWidget({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: double.infinity,
        height: getProportionateScreenHeight(50),
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15),
          vertical: getProportionateScreenHeight(10),
        ),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -2),
              color: const Color(0xff979797).withOpacity(0.2),
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
