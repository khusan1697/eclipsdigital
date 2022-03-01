import 'package:flutter/material.dart';

import '../size_config.dart';

class DefaultTextWidget extends StatelessWidget {
  final String text;

  const DefaultTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: getProportionateScreenWidth(15),
      ),
    );
  }
}
