import 'package:eclipsdigital/model/posts.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';

import '../size_config.dart';

class UserPostItemLoadingWidget extends StatelessWidget {
  const UserPostItemLoadingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.grey.withOpacity(0.2),
      child: Container(
        margin: EdgeInsets.all(getProportionateScreenWidth(10)),
        width: double.infinity,
        padding: EdgeInsets.all(getProportionateScreenWidth(10)),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -1),
              color: Colors.black.withOpacity(0.1),
              blurRadius: 2,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Shimmer.fromColors(
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
            const SizedBox(height: 10),
            Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.5),
              highlightColor: Colors.grey.withOpacity(0.2),
              child: Container(
                width: getProportionateScreenWidth(250),
                height: getProportionateScreenHeight(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
