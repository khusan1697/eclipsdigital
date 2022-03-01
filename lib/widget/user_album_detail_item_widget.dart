import 'package:cached_network_image/cached_network_image.dart';
import 'package:eclipsdigital/model/photos.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class UserAlbumDetailItemWidget extends StatelessWidget {
  final Photos photos;

  const UserAlbumDetailItemWidget({
    Key? key,
    required this.photos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xff979797).withOpacity(0.2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              height: getProportionateScreenHeight(200),
              width: double.infinity,
              imageUrl: photos.url,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: Icon(
                  Icons.image,
                  color: Color(0xff979797),
                  size: 100,
                ),
              ),
              errorWidget: (context, url, error) => const Center(
                child: Icon(
                  Icons.image,
                  color: Color(0xff979797),
                  size: 100,
                ),
              ),
            ),
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
                child: CachedNetworkImage(
                  imageUrl: photos.thumbnailUrl,
                  height: getProportionateScreenHeight(50),
                  width: getProportionateScreenWidth(50),
                  placeholder: (context, url) => const Center(
                    child: Icon(
                      Icons.image,
                      color: Color(0xff979797),
                      size: 50,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(
                      Icons.image,
                      color: Color(0xff979797),
                      size: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
              Expanded(
                child: Text(
                  photos.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(18),
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
