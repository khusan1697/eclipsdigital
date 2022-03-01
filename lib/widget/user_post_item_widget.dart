import 'package:eclipsdigital/model/posts.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../size_config.dart';

class UserPostItemWidget extends StatelessWidget {
  final Posts posts;

  const UserPostItemWidget({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text(
            posts.title,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(20),
              fontWeight: FontWeight.bold,
            ),
          ),
          ReadMoreText(
            posts.body,
            trimLines: 2,
            trimCollapsedText: "Show more",
            trimExpandedText: "Show less",
            trimMode: TrimMode.Line,
            moreStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            lessStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
            ),
          )
        ],
      ),
    );
  }
}
