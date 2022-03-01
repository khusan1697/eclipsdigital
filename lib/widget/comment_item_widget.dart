import 'package:eclipsdigital/model/comments.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CommentItemWidget extends StatelessWidget {
  final Comments comments;

  const CommentItemWidget({
    Key? key,
    required this.comments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
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
          Text(
            comments.email,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${comments.name}:",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          ReadMoreText(
            comments.body,
            textAlign: TextAlign.left,
            trimLines: 2,
            trimCollapsedText: "Show more",
            trimExpandedText: "Show less",
            trimMode: TrimMode.Line,
            colorClickableText: Colors.pink,
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
