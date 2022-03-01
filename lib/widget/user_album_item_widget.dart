import 'package:eclipsdigital/model/albums.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class UserAlbumItemWidget extends StatelessWidget {
  final Albums albums;
  final GestureTapCallback press;

  const UserAlbumItemWidget(
      {Key? key, required this.albums, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(getProportionateScreenWidth(10)),
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -2),
              color: Colors.black26.withOpacity(0.2),
              blurRadius: 5,
            ),
          ],
        ),
        child: Text(
          albums.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(18),
          ),
        ),
      ),
    );
  }
}
