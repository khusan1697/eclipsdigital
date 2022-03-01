import 'package:eclipsdigital/screens/profile_add_post_screen.dart';
import 'package:eclipsdigital/size_config.dart';
import 'package:eclipsdigital/style/theme.dart';
import 'package:flutter/material.dart';

class ProfilePostsScreen extends StatefulWidget {
  const ProfilePostsScreen({Key? key}) : super(key: key);

  @override
  _ProfilePostsScreenState createState() => _ProfilePostsScreenState();
}

class _ProfilePostsScreenState extends State<ProfilePostsScreen> {
  String? email;
  String? name;
  String? description;
  List<String> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      errors.add(error!);
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      errors.remove(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Posts",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(13)),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProfileAddPostScreen(),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(right: getProportionateScreenWidth(20)),
                  child: Text(
                    "Add",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "There is no posts, for posting you have to click \"Add\" button on the right corner",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
