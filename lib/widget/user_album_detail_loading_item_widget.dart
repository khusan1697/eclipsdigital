import 'package:cached_network_image/cached_network_image.dart';
import 'package:eclipsdigital/model/photos.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../size_config.dart';

class UserAlbumDetailItemLoadingWidget extends StatelessWidget {
  const UserAlbumDetailItemLoadingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.5),
          highlightColor: Colors.grey.withOpacity(0.2),
          child: Container(
            width: double.infinity,
            height: getProportionateScreenHeight(200),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(getProportionateScreenWidth(10))),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(10)),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(10),
                ),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.5),
                  highlightColor: Colors.grey.withOpacity(0.2),
                  child: Container(
                    height: getProportionateScreenHeight(50),
                    width: getProportionateScreenWidth(50),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.5),
                  highlightColor: Colors.grey.withOpacity(0.2),
                  child: Container(
                    height: getProportionateScreenHeight(20),
                    width: getProportionateScreenWidth(100),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
