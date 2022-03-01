import 'package:eclipsdigital/screens/profile_posts_screen.dart';
import 'package:eclipsdigital/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widget/default_buttom_widget.dart';
import '../widget/default_text_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "email",
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu_outlined,
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
                  children: const [
                    DefaultTextWidget(text: "Username"),
                    SizedBox(height: 5),
                    DefaultTextWidget(text: "Name"),
                    SizedBox(height: 5),
                    DefaultTextWidget(text: "Phone"),
                    SizedBox(height: 5),
                    DefaultTextWidget(text: "Website")
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            DefaultButtonWidget(
              text: "Company",
              press: () {},
            ),
            const SizedBox(height: 20),
            DefaultButtonWidget(
              text: "Address",
              press: () {},
            ),
            const SizedBox(height: 20),
            DefaultButtonWidget(
              text: "Posts",
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProfilePostsScreen(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            DefaultButtonWidget(
              text: "Album",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
