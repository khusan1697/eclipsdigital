import 'package:eclipsdigital/model/posts.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
import '../size_config.dart';

class PostItemLoadingWidget extends StatelessWidget {
  const PostItemLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      child: Shimmer.fromColors(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(15),
                ),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.5),
                  highlightColor: Colors.grey.withOpacity(0.3),
                  child: Container(
                    height: getProportionateScreenHeight(20),
                    width: getProportionateScreenWidth(170),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15)),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.5),
                  highlightColor: Colors.grey.withOpacity(0.3),
                  child: Container(
                    height: getProportionateScreenHeight(20),
                    width: getProportionateScreenWidth(320),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(
                  getProportionateScreenWidth(3),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Shimmer.fromColors(
                      baseColor: Colors.grey.withOpacity(0.5),
                      highlightColor: Colors.grey.withOpacity(0.3),
                      child: Container(
                        height: getProportionateScreenHeight(35),
                        width: getProportionateScreenWidth(35),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Shimmer.fromColors(
                      baseColor: Colors.grey.withOpacity(0.5),
                      highlightColor: Colors.grey.withOpacity(0.3),
                      child: Container(
                        height: getProportionateScreenHeight(35),
                        width: getProportionateScreenWidth(35),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Shimmer.fromColors(
                      baseColor: Colors.grey.withOpacity(0.5),
                      highlightColor: Colors.grey.withOpacity(0.3),
                      child: Container(
                        height: getProportionateScreenHeight(35),
                        width: getProportionateScreenWidth(35),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        baseColor: Colors.grey.withOpacity(0.5),
        highlightColor: Colors.grey.withOpacity(0.3),
      ),
    );
  }
}
