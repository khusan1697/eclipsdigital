import 'package:eclipsdigital/widget/favourite_item_widget.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favourite Post",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            FavouriteItemWidget(
              text1:
                  "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
              text2:
                  "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto",
            ),
            FavouriteItemWidget(
              text1:
                  "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
              text2:
                  "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto",
            ),
          ],
        ),
      ),
    );
  }
}
