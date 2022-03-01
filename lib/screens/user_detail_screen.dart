import 'package:eclipsdigital/model/users.dart';
import 'package:eclipsdigital/screens/user_address_screen.dart';
import 'package:eclipsdigital/screens/company_screen.dart';
import 'package:eclipsdigital/screens/user_album_screen.dart';
import 'package:eclipsdigital/screens/user_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../size_config.dart';
import '../widget/default_buttom_widget.dart';
import '../widget/default_text_widget.dart';

class UserDetailScreen extends StatelessWidget {
  final Users user;

  const UserDetailScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(40)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu_outlined,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    user.email,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(15),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: getProportionateScreenHeight(70),
                    width: getProportionateScreenWidth(70),
                    decoration: const BoxDecoration(
                      color: Color(0xff979797),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset("assets/icons/profile-active.svg"),
                  ),
                  const SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultTextWidget(text: user.username),
                      const SizedBox(height: 5),
                      DefaultTextWidget(text: user.name),
                      const SizedBox(height: 5),
                      DefaultTextWidget(text: user.phone),
                      const SizedBox(height: 5),
                      DefaultTextWidget(text: user.website)
                    ],
                  )
                ],
              ),
              const SizedBox(height: 40),
              DefaultButtonWidget(
                text: "Company",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => UserCompanyScreen(
                      company: user.company,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DefaultButtonWidget(
                text: "Address",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => UserAddressScreen(
                      address: user.address,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DefaultButtonWidget(
                text: "Posts",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => UserPostScreen(
                      userId: user.id,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DefaultButtonWidget(
                text: "Album",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AlbumScreen(userId: user.id),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
