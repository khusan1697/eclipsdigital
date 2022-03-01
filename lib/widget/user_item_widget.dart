import 'package:eclipsdigital/model/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../size_config.dart';

class UserItemWidget extends StatelessWidget {
  final Users users;
  final GestureTapCallback press;

  const UserItemWidget({
    Key? key,
    required this.users,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(
          getProportionateScreenWidth(20),
        ),
        margin: EdgeInsets.all(
          getProportionateScreenWidth(10),
        ),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -5),
              color: const Color(0xff979797).withOpacity(0.1),
              blurRadius: 6,
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              height: getProportionateScreenHeight(50),
              width: getProportionateScreenWidth(50),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                "assets/icons/profile-active.svg",
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  users.username,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(16)),
                ),
                Text(
                  users.name,
                  style: const TextStyle(
                    color: Color(0xff979797),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
