import 'package:eclipsdigital/model/albums.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../size_config.dart';

class UserAlbumItemLoadingWidget extends StatelessWidget {
  const UserAlbumItemLoadingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.grey.withOpacity(0.2),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(getProportionateScreenWidth(10)),
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.5),
          highlightColor: Colors.grey.withOpacity(0.2),
          child: Container(
            width: getProportionateScreenWidth(100),
            height: getProportionateScreenHeight(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
