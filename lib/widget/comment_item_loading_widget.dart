import 'package:eclipsdigital/model/comments.dart';
import 'package:eclipsdigital/size_config.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';

class CommentItemLoadingWidget extends StatelessWidget {
  const CommentItemLoadingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.grey.withOpacity(0.2),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
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
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.5),
              highlightColor: Colors.grey.withOpacity(0.2),
              child: Container(
                width: getProportionateScreenWidth(200),
                height: getProportionateScreenHeight(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.5),
              highlightColor: Colors.grey.withOpacity(0.2),
              child: Container(
                width: double.infinity,
                height: getProportionateScreenHeight(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
