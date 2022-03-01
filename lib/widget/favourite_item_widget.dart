import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:readmore/readmore.dart';

import '../size_config.dart';

class FavouriteItemWidget extends StatelessWidget {
  final String text1, text2;

  const FavouriteItemWidget({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -2),
              blurRadius: 6,
              color: Colors.white.withOpacity(0.1),
            )
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(15),
              ),
              child: Text(
                text1,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(20),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(15)),
              child: ReadMoreText(
                text2,
                textAlign: TextAlign.left,
                trimLines: 2,
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                trimCollapsedText: "Show more",
                trimExpandedText: "Show less",
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
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                getProportionateScreenWidth(3),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Ionicons.chatbubbles_outline,
                      color: Colors.white,
                      size: getProportionateScreenWidth(25),
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Ionicons.paper_plane_outline,
                      color: Colors.white,
                      size: getProportionateScreenWidth(25),
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Ionicons.share_social,
                      color: Colors.white,
                      size: getProportionateScreenWidth(25),
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
